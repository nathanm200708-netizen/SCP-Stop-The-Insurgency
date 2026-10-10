/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 04B1FD24
event_inherited();

/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 779CFF1C
/// @DnDArgument : "obj" "Objecobj_controlst"
/// @DnDSaveInfo : "obj" "Objecobj_controlst"
var l779CFF1C_0 = false;l779CFF1C_0 = instance_exists(Objecobj_controlst);if(l779CFF1C_0){	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 669582B4
	/// @DnDApplyTo : {Objecobj_controlst}
	/// @DnDParent : 779CFF1C
	with(Objecobj_controlst) instance_destroy();}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 73717923
else{	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 01BEA34E
	/// @DnDParent : 73717923
	/// @DnDArgument : "xpos" "room_width/2"
	/// @DnDArgument : "ypos" "room_height-100"
	/// @DnDArgument : "objectid" "Objecobj_controlst"
	/// @DnDSaveInfo : "objectid" "Objecobj_controlst"
	instance_create_layer(room_width/2, room_height-100, "Instances", Objecobj_controlst);}