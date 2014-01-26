private ["_initialFog", "_initialOvercast", "_initialRain", "_initialWind", "_debug"];
private ["_minWeatherChangeTimeMin", "_maxWeatherChangeTimeMin", "_minTimeBetweenWeatherChangesMin", "_maxTimeBetweenWeatherChangesMin", "_rainIntervalRainProbability", "_windChangeProbability"];
private ["_minimumFog", "_maximumFog", "_minimumOvercast", "_maximumOvercast", "_minimumRain", "_maximumRain", "_minimumWind", "_maximumWind", "_minRainIntervalTimeMin", "_maxRainIntervalTimeMin", "_forceRainToStopAfterOneRainInterval", "_maxWind"];
private ["_minimumFogDecay", "_maximumFogDecay", "_minimumFogBase", "_maximumFogBase"];
if (isNil "_this") then { _this = []; };
if (count _this > 0) then { _initialFog = _this select 0; } else { _initialFog = -1; };
if (count _this > 1) then { _initialOvercast = _this select 1; } else { _initialOvercast = -1; };
if (count _this > 2) then { _initialRain = _this select 2; } else { _initialRain = -1; };
if (count _this > 3) then { _initialWind = _this select 3; } else { _initialWind = [-1, -1]; };
if (count _this > 4) then { _debug = _this select 4; } else { _debug = false; };
// _maxWeatherChangeTimeMin. When weather changes, it is fog OR overcast that changes, not both at the same time. (Suggested value: 10).
_minWeatherChangeTimeMin = 10;
_maxWeatherChangeTimeMin = 20;
_minTimeBetweenWeatherChangesMin = 5;
// _minWeatherChangeTimeMin. (Suggested value: 10).
_maxTimeBetweenWeatherChangesMin = 10;
_minimumFog = 0;
_maximumFog = 0.8;
_minimumFogDecay = 0.001;
_maximumFogDecay = 0.001;
_minimumFogBase = 500;
_maximumFogBase = 500;
_minimumOvercast = 0;
_maximumOvercast = 1;
_minimumRain = 0;
_maximumRain = 0.5;
_minimumWind = 0;
_maximumWind = 8;
_windChangeProbability = 25;
_rainIntervalRainProbability = 50;
_minRainIntervalTimeMin = 0.5;
// (_maxWeatherChangeTimeMin + _maxTimeBetweenWeatherChangesMin) / 2).
_maxRainIntervalTimeMin = (_maxWeatherChangeTimeMin + _maxTimeBetweenWeatherChangesMin) / 2;
_forceRainToStopAfterOneRainInterval = false; // Don't touch anything beneath this line
drn_DynamicWeather_DebugTextEventArgs = []; // Empty
"drn_DynamicWeather_DebugTextEventArgs" addPublicVariableEventHandler {
	drn_DynamicWeather_DebugTextEventArgs call drn_fnc_DynamicWeather_ShowDebugTextLocal;
};
drn_fnc_DynamicWeather_ShowDebugTextLocal = {
	private ["_minutes", "_seconds"];
	if (!isNull player) then {
		player sideChat (_this select 0);
	};
	_minutes = floor (time / 60);
	_seconds = floor (time - (_minutes * 60));
	diag_log ((str _minutes + ":" + str _seconds) + " Debug: " + (_this select 0));
};
drn_fnc_DynamicWeather_ShowDebugTextAllClients = {
	drn_DynamicWeather_DebugTextEventArgs = _this;
	publicVariable "drn_DynamicWeather_DebugTextEventArgs";
	drn_DynamicWeather_DebugTextEventArgs call drn_fnc_DynamicWeather_ShowDebugTextLocal;
};
if (_debug) then {
	["Starting script WeatherEffects.sqf..."] call drn_fnc_DynamicWeather_ShowDebugTextLocal;
};
drn_DynamicWeatherEventArgs = []; // [current overcast, current fog, current rain, current weather change ("OVERCAST", "FOG" or ""), target weather value, time until weather completion (in seconds), current wind x, current wind z]
drn_AskServerDynamicWeatherEventArgs = []; // []
drn_fnc_overcastOdds =
{
	if (_this < 1/3) then
	{
		0.1
	} else {
		(9/4) * (_this - (1/3)) ^ 2 + 0.1
	}
};
	drn_fnc_fogOdds =
	{
		if (_this < 1/3) then
		{
			0
		} else {
			(9/4) * (_this - (1/3)) ^ 2
		}
	};
	drn_fnc_DynamicWeather_SetWeatherLocal = {
		private ["_currentOvercast", "_currentFog", "_currentRain", "_currentWeatherChange", "_targetWeatherValue", "_timeUntilCompletion", "_currentWindX", "_currentWindZ"];
		_currentOvercast = _this select 0;
		_currentFog = _this select 1;
		_currentRain = _this select 2;
		_currentWeatherChange = _this select 3;
		_targetWeatherValue = _this select 4;
		_timeUntilCompletion = _this select 5;
		_currentWindX = _this select 6;
		_currentWindZ = _this select 7;
		if (typeName _currentFog == "ARRAY") then {
			_currentFog set [0, (_currentFog select 0) max (_currentRain / 4)];
		} else {
		_currentFog = _currentFog max (_currentRain / 4);
		};
		if (date select 2 > 4 && date select 2 < 19) then
		{
			0 setOvercast _currentOvercast;
		} else {
			0 setOvercast (0.1 max _currentOvercast);
		};
		0 setFog [_currentFog max (_currentRain / 4), 0.001, 1000];
		drn_var_DynamicWeather_Rain = _currentRain;
		setWind [_currentWindX, _currentWindZ, true];
		if (!isNil "drn_JIPWeatherSync") then
		{
			sleep 0.5;
			skipTime 1;
			sleep 0.5;
			skipTime -1;
			drn_JIPWeatherSync = nil;
		};
		if (_currentWeatherChange == "OVERCAST") then {
			if (date select 2 > 4 && date select 2 < 18) then
			{
				_timeUntilCompletion setOvercast (_targetWeatherValue call drn_fnc_overcastOdds);
			} else {
			_timeUntilCompletion setOvercast (0.1 max (_targetWeatherValue call drn_fnc_overcastOdds));
			};
			5 setFog [_currentRain / 4, 0.001, 1000]; // Quick hack to ensure fog goes away regularly
			_currentFog
			};
			if (_currentWeatherChange == "FOG") then {
				if (typeName _targetWeatherValue == "ARRAY") then {
					_targetWeatherValue set [0, (_targetWeatherValue select 0) max (_currentRain / 4)];
				} else {
					_targetWeatherValue = _targetWeatherValue max (_currentRain / 4);
				};
				_timeUntilCompletion setFog _targetWeatherValue;
			};
		};
		if (!isDedicated) then
		{
			drn_JIPWeatherSync = true;
		};
		if (!isServer) then {
			"drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {
			drn_DynamicWeatherEventArgs spawn drn_fnc_DynamicWeather_SetWeatherLocal;
		};
		waitUntil {!isNil "drn_var_DynamicWeather_ServerInitialized"};
		drn_AskServerDynamicWeatherEventArgs = [true];
		publicVariable "drn_AskServerDynamicWeatherEventArgs";
		};
		if (isServer) then {
			drn_fnc_DynamicWeather_SetWeatherAllClients = {
				private ["_timeUntilCompletion", "_currentWeatherChange"];
				_timeUntilCompletion = drn_DynamicWeather_WeatherChangeCompletedTime - drn_DynamicWeather_WeatherChangeStartedTime;
				if (_timeUntilCompletion > 0) then {
					_currentWeatherChange = drn_DynamicWeather_CurrentWeatherChange;
				} else {
					_currentWeatherChange = "";
				};
				drn_DynamicWeatherEventArgs = [overcast, fog, drn_var_DynamicWeather_Rain, _currentWeatherChange, drn_DynamicWeather_WeatherTargetValue, _timeUntilCompletion, drn_DynamicWeather_WindX, drn_DynamicWeather_WindZ];
				publicVariable "drn_DynamicWeatherEventArgs";
				drn_DynamicWeatherEventArgs spawn drn_fnc_DynamicWeather_SetWeatherLocal;
			};
			"drn_AskServerDynamicWeatherEventArgs" addPublicVariableEventHandler {
				[] spawn drn_fnc_DynamicWeather_SetWeatherAllClients;
			};
			drn_DynamicWeather_CurrentWeatherChange = "";
			drn_DynamicWeather_WeatherTargetValue = 0;
			drn_DynamicWeather_WeatherChangeStartedTime = time;
			drn_DynamicWeather_WeatherChangeCompletedTime = time;
			drn_DynamicWeather_WindX = _initialWind select 0;
			drn_DynamicWeather_WindZ = _initialWind select 1;
			if (_initialFog == -1) then {
				_initialFog = (_minimumFog + random (_maximumFog - _minimumFog));
			} else {
				if (_initialFog < _minimumFog) then {
					_initialFog = _minimumFog;
				};
				if (_initialFog > _maximumFog) then {
					_initialFog = _maximumFog;
				};
			};
			0 setFog [(((_initialFog / _maximumFog) call drn_fnc_fogOdds) * _maximumFog) max (rain / 4), 0.001, 1000];
			if (_initialOvercast == -1) then {
				_initialOvercast = (_minimumOvercast + random (_maximumOvercast - _minimumOvercast));
			} else {
				if (_initialOvercast < _minimumOvercast) then {
					_initialOvercast = _minimumOvercast;
				};
				if (_initialOvercast > _maximumOvercast) then {
					_initialOvercast = _maximumOvercast;
				};
			};
			0 setOvercast (_initialOvercast call drn_fnc_overcastOdds);
			if (_initialOvercast >= 0.75) then {
				if (_initialRain == -1) then {
					_initialRain = (_minimumRain + random (_minimumRain - _minimumRain));
				} else {
					if (_initialRain < _minimumRain) then {
						_initialRain = _minimumRain;
					};
					if (_initialRain > _maximumRain) then {
						_initialRain = _maximumRain;
					};
				};
			} else {
				_initialRain = 0;
			};
			drn_var_DynamicWeather_Rain = _initialRain;
			0 setRain drn_var_DynamicWeather_Rain;
			0 setFog [drn_var_DynamicWeather_Rain / 4, 0.001, 1000];
			_maxWind = _minimumWind + random (_maximumWind - _minimumWind);
			if (drn_DynamicWeather_WindX == -1) then {
				if (random 100 < 50) then {
					drn_DynamicWeather_WindX = -_minimumWind - random (_maxWind - _minimumWind);
				} else {
					drn_DynamicWeather_WindX = _minimumWind + random (_maxWind - _minimumWind);
				};
			};
			if (drn_DynamicWeather_WindZ == -1) then {
				if (random 100 < 50) then {
					drn_DynamicWeather_WindZ = -_minimumWind - random (_maxWind - _minimumWind);
				} else {
					drn_DynamicWeather_WindZ = _minimumWind + random (_maxWind - _minimumWind);
				};
			};
			setWind [drn_DynamicWeather_WindX, drn_DynamicWeather_WindZ, true];
			if (!isNil "drn_JIPWeatherSync") then
			{
				sleep 0.5;
				skipTime 1;
				sleep 0.5;
				skipTime -1;
				drn_JIPWeatherSync = nil;
			};
			sleep 0.05;
			publicVariable "drn_var_DynamicWeather_Rain";
			drn_var_DynamicWeather_ServerInitialized = true;
			publicVariable "drn_var_DynamicWeather_ServerInitialized";
			[_minWeatherChangeTimeMin, _maxWeatherChangeTimeMin, _minTimeBetweenWeatherChangesMin, _maxTimeBetweenWeatherChangesMin, _minimumFog, _maximumFog, _minimumFogDecay, _maximumFogDecay, _minimumFogBase, _maximumFogBase, _minimumOvercast, _maximumOvercast, _minimumWind, _maximumWind, _windChangeProbability, _debug] spawn {
				private ["_minWeatherChangeTimeMin", "_maxWeatherChangeTimeMin", "_minTimeBetweenWeatherChangesMin", "_maxTimeBetweenWeatherChangesMin", "_minimumFog", "_maximumFog", "_minimumOvercast", "_maximumOvercast", "_minimumWind", "_maximumWind", "_windChangeProbability", "_debug"];
				private ["_weatherType", "_fogLevel", "_overcastLevel", "_oldFogLevel", "_oldOvercastLevel", "_weatherChangeTimeSek"];
				private ["_fogValue", "_fogBase", "_fogDecay"];
				_minWeatherChangeTimeMin = _this select 0;
				_maxWeatherChangeTimeMin = _this select 1;
				_minTimeBetweenWeatherChangesMin = _this select 2;
				_maxTimeBetweenWeatherChangesMin = _this select 3;
				_minimumFog = _this select 4;
				_maximumFog = _this select 5;
				_minimumFogDecay = _this select 6;
				_maximumFogDecay = _this select 7;
				_minimumFogBase = _this select 8;
				_maximumFogBase = _this select 9;
				_minimumOvercast = _this select 10;
				_maximumOvercast = _this select 11;
				_minimumWind = _this select 12;
				_maximumWind = _this select 13;
				_windChangeProbability = _this select 14;
				_debug = _this select 15;
				_fogLevel = 2;
				_overcastLevel = 2;
				while {true} do {
					sleep floor (_minTimeBetweenWeatherChangesMin * 60 + random ((_maxTimeBetweenWeatherChangesMin - _minTimeBetweenWeatherChangesMin) * 60));
					if (_minimumFog == _maximumFog && _minimumOvercast != _maximumOvercast) then {
						_weatherType = "OVERCAST";
					};
					if (_minimumFog != _maximumFog && _minimumOvercast == _maximumOvercast) then {
						_weatherType = "FOG";
					};
					if (_minimumFog != _maximumFog && _minimumOvercast != _maximumOvercast) then {
						if ((random 100) < 50) then {
							_weatherType = "OVERCAST";
						} else {
							_weatherType = "FOG";
						};
					};
					if (_weatherType == "FOG") then {
						drn_DynamicWeather_CurrentWeatherChange = "FOG";
						_oldFogLevel = _fogLevel;
						_fogLevel = floor ((random 100) / 25);
						while {_fogLevel == _oldFogLevel} do {
							_fogLevel = floor ((random 100) / 25);
						};
						_fogDecay = _minimumFogDecay + (_maximumFogDecay - _minimumFogDecay) * random 1;
						_fogBase = _minimumFogBase + (_maximumFogBase - _minimumFogBase) * random 1;
						_fogValue = 0;
						if (_fogLevel == 0) then {
							_fogValue = _minimumFog + (_maximumFog - _minimumFog) * random 0.05;
						};
						if (_fogLevel == 1) then {
							_fogValue = _minimumFog + (_maximumFog - _minimumFog) * (0.05 + random 0.2);
						};
						if (_fogLevel == 2) then {
							_fogValue = _minimumFog + (_maximumFog - _minimumFog) * (0.25 + random 0.3);
						};
						if (_fogLevel == 3) then {
							_fogValue = _minimumFog + (_maximumFog - _minimumFog) * (0.55 + random 0.45);
						};
						drn_DynamicWeather_WeatherTargetValue = [((_fogValue / _maximumFog) call drn_fnc_fogOdds) * _maximumFog, _fogDecay, _fogBase];
						drn_DynamicWeather_WeatherChangeStartedTime = time;
						_weatherChangeTimeSek = _minWeatherChangeTimeMin * 60 + random ((_maxWeatherChangeTimeMin - _minWeatherChangeTimeMin) * 60);
						drn_DynamicWeather_WeatherChangeCompletedTime = time + _weatherChangeTimeSek;
						if (_debug) then {
							["Weather forecast: Fog " + str drn_DynamicWeather_WeatherTargetValue + " in " + str round (_weatherChangeTimeSek / 60) + " minutes."] call drn_fnc_DynamicWeather_ShowDebugTextAllClients;
						};
					};
					if (_weatherType == "OVERCAST") then {
						drn_DynamicWeather_CurrentWeatherChange = "OVERCAST";
						_oldOvercastLevel = _overcastLevel;
						//_overcastLevel = floor ((random 100) / 25);
						_overcastLevel = 3;
						while {_overcastLevel == _oldOvercastLevel} do {
							_overcastLevel = floor ((random 100) / 25);
						};
						if (_overcastLevel == 0) then {
							drn_DynamicWeather_WeatherTargetValue = _minimumOvercast + (_maximumOvercast - _minimumOvercast) * random 0.05;
						};
						if (_overcastLevel == 1) then {
							drn_DynamicWeather_WeatherTargetValue = _minimumOvercast + (_maximumOvercast - _minimumOvercast) * (0.05 + random 0.3);
						};
						if (_overcastLevel == 2) then {
							drn_DynamicWeather_WeatherTargetValue = _minimumOvercast + (_maximumOvercast - _minimumOvercast) * (0.35 + random 0.35);
						};
						if (_overcastLevel == 3) then {
							drn_DynamicWeather_WeatherTargetValue = _minimumOvercast + (_maximumOvercast - _minimumOvercast) * (0.7 + random 0.3);
						};
						drn_DynamicWeather_WeatherChangeStartedTime = time;
						_weatherChangeTimeSek = _minWeatherChangeTimeMin * 60 + random ((_maxWeatherChangeTimeMin - _minWeatherChangeTimeMin) * 60);
						drn_DynamicWeather_WeatherChangeCompletedTime = time + _weatherChangeTimeSek;
						if (_debug) then {
							["Weather forecast: Overcast " + str drn_DynamicWeather_WeatherTargetValue + " in " + str round (_weatherChangeTimeSek / 60) + " minutes."] call drn_fnc_DynamicWeather_ShowDebugTextAllClients;
						};
					};
					if (random 100 < _windChangeProbability) then {
						private ["_maxWind"];
						_maxWind = _minimumWind + random (_maximumWind - _minimumWind);
						if (random 100 < 50) then {
							drn_DynamicWeather_WindX = -_minimumWind - random (_maxWind - _minimumWind);
						} else {
							drn_DynamicWeather_WindX = _minimumWind + random (_maxWind - _minimumWind);
						};
						if (random 100 < 50) then {
							drn_DynamicWeather_WindZ = -_minimumWind - random (_maxWind - _minimumWind);
						} else {
							drn_DynamicWeather_WindZ = _minimumWind + random (_maxWind - _minimumWind);
						};
						if (_debug) then {
							["Wind changes: [" + str drn_DynamicWeather_WindX + ", " + str drn_DynamicWeather_WindZ + "]."] call drn_fnc_DynamicWeather_ShowDebugTextAllClients;
						};
					};
					call drn_fnc_DynamicWeather_SetWeatherAllClients;
					sleep _weatherChangeTimeSek;
				};
			};
			if (_rainIntervalRainProbability > 0) then {
				[_minimumRain, _maximumRain, _forceRainToStopAfterOneRainInterval, _minRainIntervalTimeMin, _maxRainIntervalTimeMin, _rainIntervalRainProbability, _debug] spawn {
				private ["_minimumRain", "_maximumRain", "_forceRainToStopAfterOneRainInterval", "_minRainIntervalTimeMin", "_maxRainIntervalTimeMin", "_rainIntervalRainProbability", "_debug"];
				private ["_nextRainEventTime", "_forceStop"];
				_minimumRain = _this select 0;
				_maximumRain = _this select 1;
				_forceRainToStopAfterOneRainInterval = _this select 2;
				_minRainIntervalTimeMin = _this select 3;
				_maxRainIntervalTimeMin = _this select 4;
				_rainIntervalRainProbability = _this select 5;
				_debug = _this select 6;
				if (rain > 0) then {
					drn_var_DynamicWeather_Rain = rain;
					publicVariable "drn_var_DynamicWeather_Rain";
				};
				_nextRainEventTime = time;
				_forceStop = false;
				while {true} do {
					if (overcast > 0.75) then {
						if (time >= _nextRainEventTime) then {
							private ["_rainTimeSec"];
							if (random 100 < _rainIntervalRainProbability && !_forceStop) then {
								drn_var_DynamicWeather_rain = _minimumRain + random (_maximumRain - _minimumRain);
								publicVariable "drn_var_DynamicWeather_rain";
								_forceStop = _forceRainToStopAfterOneRainInterval;
							} else {
								drn_var_DynamicWeather_rain = 0;
								publicVariable "drn_var_DynamicWeather_rain";
								_forceStop = false;
							};
							_rainTimeSec = _minRainIntervalTimeMin * 60 + random ((_maxRainIntervalTimeMin - _minRainIntervalTimeMin) * 60);
							_nextRainEventTime = time + _rainTimeSec;
							if (_debug) then {
								["Rain set to " + str drn_var_DynamicWeather_rain + " for " + str (_rainTimeSec / 60) + " minutes"] call drn_fnc_DynamicWeather_ShowDebugTextAllClients;
							};
						};
					} else {
						if (drn_var_DynamicWeather_rain != 0) then {
							drn_var_DynamicWeather_rain = 0;
							publicVariable "drn_var_DynamicWeather_rain";
							if (_debug) then {
								["Rain stops due to low overcast."] call drn_fnc_DynamicWeather_ShowDebugTextAllClients;
							};
						};
						_nextRainEventTime = time;
						_forceStop = false;
					};
					if (_debug) then {
						sleep 1;
					} else {
						sleep 20;
					};
				};
			};
		};
	};
	[_rainIntervalRainProbability, _debug] spawn {
		private ["_rainIntervalRainProbability", "_debug"];
		private ["_rain", "_rainPerSecond"];
		_rainIntervalRainProbability = _this select 0;
		_debug = _this select 1;
		if (_debug) then {
			_rainPerSecond = 0.2;
		} else {
			_rainPerSecond = 0.03;
		};
		if (_rainIntervalRainProbability > 0) then {
			_rain = drn_var_DynamicWeather_Rain;
		} else {
			_rain = 0;
		};
		0 setRain _rain;
		0 setFog [fog max (_rain / 4), 0.001, 1000];
		sleep 0.1;
		while {true} do {
			if (_rainIntervalRainProbability > 0) then {
				if (_rain < drn_var_DynamicWeather_Rain) then {
				_rain = _rain + _rainPerSecond;
				if (_rain > 1) then { _rain = 1; };
				};
				if (_rain > drn_var_DynamicWeather_Rain) then {
					_rain = _rain - _rainPerSecond;
					if (_rain < 0) then { _rain = 0; };
				};
			} else {
				_rain = 0;
			};
			3 setRain _rain;
			3 setFog [fog max (_rain / 4), 0.001, 1000];
			sleep 10;
		};
	};