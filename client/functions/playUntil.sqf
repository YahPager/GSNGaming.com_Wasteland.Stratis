#define DURATION_STEP 0.1
#define DURATION_FAILED 5

//TODO: Fix the jerkiness (playMove vs switchMove)
private ["_length", "_animation", "_check", "_args"];

_length = _this select 0;
_animation = _this select 1;
_check = _this select 2;
_args = _this select 3;

private ["_complete", "_start", "_restartAnim", "_previousAnim"];

_complete = true;
_start = time;
_restartAnim = {player playMove _animation};
_previousAnim = animationState player;
player playMove _animation;

while {time < _start+_length} do {
	if (animationState player != _animation) then _restartAnim;
	private ["_failed", "_progress"];
	_progress = (time - _start)/_length;
	_result = ([_progress]+_args) call _check;
	_failed = _result select 0;
	_text = _result select 1;
	if (_text != "") then {
		if _failed then {
			[_text, DURATION_FAILED] call mf_notify_client;
		} else {
			[_text, DURATION_STEP] call mf_notify_client;
		};
	};
	if _failed exitWith {_complete = false};

	sleep DURATION_STEP;
};

player playMove _previousAnim;

_complete;