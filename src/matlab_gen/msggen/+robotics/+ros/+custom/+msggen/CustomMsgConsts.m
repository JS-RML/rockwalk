classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2014-2018 The MathWorks, Inc.
    
    properties (Constant)
        moveit_msgs_AllowedCollisionEntry = 'moveit_msgs/AllowedCollisionEntry'
        moveit_msgs_AllowedCollisionMatrix = 'moveit_msgs/AllowedCollisionMatrix'
        moveit_msgs_ApplyPlanningScene = 'moveit_msgs/ApplyPlanningScene'
        moveit_msgs_ApplyPlanningSceneRequest = 'moveit_msgs/ApplyPlanningSceneRequest'
        moveit_msgs_ApplyPlanningSceneResponse = 'moveit_msgs/ApplyPlanningSceneResponse'
        moveit_msgs_AttachedCollisionObject = 'moveit_msgs/AttachedCollisionObject'
        moveit_msgs_BoundingVolume = 'moveit_msgs/BoundingVolume'
        moveit_msgs_CheckIfRobotStateExistsInWarehouse = 'moveit_msgs/CheckIfRobotStateExistsInWarehouse'
        moveit_msgs_CheckIfRobotStateExistsInWarehouseRequest = 'moveit_msgs/CheckIfRobotStateExistsInWarehouseRequest'
        moveit_msgs_CheckIfRobotStateExistsInWarehouseResponse = 'moveit_msgs/CheckIfRobotStateExistsInWarehouseResponse'
        moveit_msgs_CollisionObject = 'moveit_msgs/CollisionObject'
        moveit_msgs_ConstraintEvalResult = 'moveit_msgs/ConstraintEvalResult'
        moveit_msgs_Constraints = 'moveit_msgs/Constraints'
        moveit_msgs_ContactInformation = 'moveit_msgs/ContactInformation'
        moveit_msgs_CostSource = 'moveit_msgs/CostSource'
        moveit_msgs_DeleteRobotStateFromWarehouse = 'moveit_msgs/DeleteRobotStateFromWarehouse'
        moveit_msgs_DeleteRobotStateFromWarehouseRequest = 'moveit_msgs/DeleteRobotStateFromWarehouseRequest'
        moveit_msgs_DeleteRobotStateFromWarehouseResponse = 'moveit_msgs/DeleteRobotStateFromWarehouseResponse'
        moveit_msgs_DisplayRobotState = 'moveit_msgs/DisplayRobotState'
        moveit_msgs_DisplayTrajectory = 'moveit_msgs/DisplayTrajectory'
        moveit_msgs_ExecuteKnownTrajectory = 'moveit_msgs/ExecuteKnownTrajectory'
        moveit_msgs_ExecuteKnownTrajectoryRequest = 'moveit_msgs/ExecuteKnownTrajectoryRequest'
        moveit_msgs_ExecuteKnownTrajectoryResponse = 'moveit_msgs/ExecuteKnownTrajectoryResponse'
        moveit_msgs_ExecuteTrajectoryAction = 'moveit_msgs/ExecuteTrajectoryAction'
        moveit_msgs_ExecuteTrajectoryActionFeedback = 'moveit_msgs/ExecuteTrajectoryActionFeedback'
        moveit_msgs_ExecuteTrajectoryActionGoal = 'moveit_msgs/ExecuteTrajectoryActionGoal'
        moveit_msgs_ExecuteTrajectoryActionResult = 'moveit_msgs/ExecuteTrajectoryActionResult'
        moveit_msgs_ExecuteTrajectoryFeedback = 'moveit_msgs/ExecuteTrajectoryFeedback'
        moveit_msgs_ExecuteTrajectoryGoal = 'moveit_msgs/ExecuteTrajectoryGoal'
        moveit_msgs_ExecuteTrajectoryResult = 'moveit_msgs/ExecuteTrajectoryResult'
        moveit_msgs_GetCartesianPath = 'moveit_msgs/GetCartesianPath'
        moveit_msgs_GetCartesianPathRequest = 'moveit_msgs/GetCartesianPathRequest'
        moveit_msgs_GetCartesianPathResponse = 'moveit_msgs/GetCartesianPathResponse'
        moveit_msgs_GetConstraintAwarePositionIK = 'moveit_msgs/GetConstraintAwarePositionIK'
        moveit_msgs_GetConstraintAwarePositionIKRequest = 'moveit_msgs/GetConstraintAwarePositionIKRequest'
        moveit_msgs_GetConstraintAwarePositionIKResponse = 'moveit_msgs/GetConstraintAwarePositionIKResponse'
        moveit_msgs_GetKinematicSolverInfo = 'moveit_msgs/GetKinematicSolverInfo'
        moveit_msgs_GetKinematicSolverInfoRequest = 'moveit_msgs/GetKinematicSolverInfoRequest'
        moveit_msgs_GetKinematicSolverInfoResponse = 'moveit_msgs/GetKinematicSolverInfoResponse'
        moveit_msgs_GetMotionPlan = 'moveit_msgs/GetMotionPlan'
        moveit_msgs_GetMotionPlanRequest = 'moveit_msgs/GetMotionPlanRequest'
        moveit_msgs_GetMotionPlanResponse = 'moveit_msgs/GetMotionPlanResponse'
        moveit_msgs_GetPlannerParams = 'moveit_msgs/GetPlannerParams'
        moveit_msgs_GetPlannerParamsRequest = 'moveit_msgs/GetPlannerParamsRequest'
        moveit_msgs_GetPlannerParamsResponse = 'moveit_msgs/GetPlannerParamsResponse'
        moveit_msgs_GetPlanningScene = 'moveit_msgs/GetPlanningScene'
        moveit_msgs_GetPlanningSceneRequest = 'moveit_msgs/GetPlanningSceneRequest'
        moveit_msgs_GetPlanningSceneResponse = 'moveit_msgs/GetPlanningSceneResponse'
        moveit_msgs_GetPositionFK = 'moveit_msgs/GetPositionFK'
        moveit_msgs_GetPositionFKRequest = 'moveit_msgs/GetPositionFKRequest'
        moveit_msgs_GetPositionFKResponse = 'moveit_msgs/GetPositionFKResponse'
        moveit_msgs_GetPositionIK = 'moveit_msgs/GetPositionIK'
        moveit_msgs_GetPositionIKRequest = 'moveit_msgs/GetPositionIKRequest'
        moveit_msgs_GetPositionIKResponse = 'moveit_msgs/GetPositionIKResponse'
        moveit_msgs_GetRobotStateFromWarehouse = 'moveit_msgs/GetRobotStateFromWarehouse'
        moveit_msgs_GetRobotStateFromWarehouseRequest = 'moveit_msgs/GetRobotStateFromWarehouseRequest'
        moveit_msgs_GetRobotStateFromWarehouseResponse = 'moveit_msgs/GetRobotStateFromWarehouseResponse'
        moveit_msgs_GetStateValidity = 'moveit_msgs/GetStateValidity'
        moveit_msgs_GetStateValidityRequest = 'moveit_msgs/GetStateValidityRequest'
        moveit_msgs_GetStateValidityResponse = 'moveit_msgs/GetStateValidityResponse'
        moveit_msgs_Grasp = 'moveit_msgs/Grasp'
        moveit_msgs_GraspPlanning = 'moveit_msgs/GraspPlanning'
        moveit_msgs_GraspPlanningRequest = 'moveit_msgs/GraspPlanningRequest'
        moveit_msgs_GraspPlanningResponse = 'moveit_msgs/GraspPlanningResponse'
        moveit_msgs_GripperTranslation = 'moveit_msgs/GripperTranslation'
        moveit_msgs_JointConstraint = 'moveit_msgs/JointConstraint'
        moveit_msgs_JointLimits = 'moveit_msgs/JointLimits'
        moveit_msgs_KinematicSolverInfo = 'moveit_msgs/KinematicSolverInfo'
        moveit_msgs_LinkPadding = 'moveit_msgs/LinkPadding'
        moveit_msgs_LinkScale = 'moveit_msgs/LinkScale'
        moveit_msgs_ListRobotStatesInWarehouse = 'moveit_msgs/ListRobotStatesInWarehouse'
        moveit_msgs_ListRobotStatesInWarehouseRequest = 'moveit_msgs/ListRobotStatesInWarehouseRequest'
        moveit_msgs_ListRobotStatesInWarehouseResponse = 'moveit_msgs/ListRobotStatesInWarehouseResponse'
        moveit_msgs_LoadMap = 'moveit_msgs/LoadMap'
        moveit_msgs_LoadMapRequest = 'moveit_msgs/LoadMapRequest'
        moveit_msgs_LoadMapResponse = 'moveit_msgs/LoadMapResponse'
        moveit_msgs_MotionPlanDetailedResponse = 'moveit_msgs/MotionPlanDetailedResponse'
        moveit_msgs_MotionPlanRequest = 'moveit_msgs/MotionPlanRequest'
        moveit_msgs_MotionPlanResponse = 'moveit_msgs/MotionPlanResponse'
        moveit_msgs_MoveGroupAction = 'moveit_msgs/MoveGroupAction'
        moveit_msgs_MoveGroupActionFeedback = 'moveit_msgs/MoveGroupActionFeedback'
        moveit_msgs_MoveGroupActionGoal = 'moveit_msgs/MoveGroupActionGoal'
        moveit_msgs_MoveGroupActionResult = 'moveit_msgs/MoveGroupActionResult'
        moveit_msgs_MoveGroupFeedback = 'moveit_msgs/MoveGroupFeedback'
        moveit_msgs_MoveGroupGoal = 'moveit_msgs/MoveGroupGoal'
        moveit_msgs_MoveGroupResult = 'moveit_msgs/MoveGroupResult'
        moveit_msgs_MoveItErrorCodes = 'moveit_msgs/MoveItErrorCodes'
        moveit_msgs_ObjectColor = 'moveit_msgs/ObjectColor'
        moveit_msgs_OrientationConstraint = 'moveit_msgs/OrientationConstraint'
        moveit_msgs_OrientedBoundingBox = 'moveit_msgs/OrientedBoundingBox'
        moveit_msgs_PickupAction = 'moveit_msgs/PickupAction'
        moveit_msgs_PickupActionFeedback = 'moveit_msgs/PickupActionFeedback'
        moveit_msgs_PickupActionGoal = 'moveit_msgs/PickupActionGoal'
        moveit_msgs_PickupActionResult = 'moveit_msgs/PickupActionResult'
        moveit_msgs_PickupFeedback = 'moveit_msgs/PickupFeedback'
        moveit_msgs_PickupGoal = 'moveit_msgs/PickupGoal'
        moveit_msgs_PickupResult = 'moveit_msgs/PickupResult'
        moveit_msgs_PlaceAction = 'moveit_msgs/PlaceAction'
        moveit_msgs_PlaceActionFeedback = 'moveit_msgs/PlaceActionFeedback'
        moveit_msgs_PlaceActionGoal = 'moveit_msgs/PlaceActionGoal'
        moveit_msgs_PlaceActionResult = 'moveit_msgs/PlaceActionResult'
        moveit_msgs_PlaceFeedback = 'moveit_msgs/PlaceFeedback'
        moveit_msgs_PlaceGoal = 'moveit_msgs/PlaceGoal'
        moveit_msgs_PlaceLocation = 'moveit_msgs/PlaceLocation'
        moveit_msgs_PlaceResult = 'moveit_msgs/PlaceResult'
        moveit_msgs_PlannerInterfaceDescription = 'moveit_msgs/PlannerInterfaceDescription'
        moveit_msgs_PlannerParams = 'moveit_msgs/PlannerParams'
        moveit_msgs_PlanningOptions = 'moveit_msgs/PlanningOptions'
        moveit_msgs_PlanningScene = 'moveit_msgs/PlanningScene'
        moveit_msgs_PlanningSceneComponents = 'moveit_msgs/PlanningSceneComponents'
        moveit_msgs_PlanningSceneWorld = 'moveit_msgs/PlanningSceneWorld'
        moveit_msgs_PositionConstraint = 'moveit_msgs/PositionConstraint'
        moveit_msgs_PositionIKRequest = 'moveit_msgs/PositionIKRequest'
        moveit_msgs_QueryPlannerInterfaces = 'moveit_msgs/QueryPlannerInterfaces'
        moveit_msgs_QueryPlannerInterfacesRequest = 'moveit_msgs/QueryPlannerInterfacesRequest'
        moveit_msgs_QueryPlannerInterfacesResponse = 'moveit_msgs/QueryPlannerInterfacesResponse'
        moveit_msgs_RenameRobotStateInWarehouse = 'moveit_msgs/RenameRobotStateInWarehouse'
        moveit_msgs_RenameRobotStateInWarehouseRequest = 'moveit_msgs/RenameRobotStateInWarehouseRequest'
        moveit_msgs_RenameRobotStateInWarehouseResponse = 'moveit_msgs/RenameRobotStateInWarehouseResponse'
        moveit_msgs_RobotState = 'moveit_msgs/RobotState'
        moveit_msgs_RobotTrajectory = 'moveit_msgs/RobotTrajectory'
        moveit_msgs_SaveMap = 'moveit_msgs/SaveMap'
        moveit_msgs_SaveMapRequest = 'moveit_msgs/SaveMapRequest'
        moveit_msgs_SaveMapResponse = 'moveit_msgs/SaveMapResponse'
        moveit_msgs_SaveRobotStateToWarehouse = 'moveit_msgs/SaveRobotStateToWarehouse'
        moveit_msgs_SaveRobotStateToWarehouseRequest = 'moveit_msgs/SaveRobotStateToWarehouseRequest'
        moveit_msgs_SaveRobotStateToWarehouseResponse = 'moveit_msgs/SaveRobotStateToWarehouseResponse'
        moveit_msgs_SetPlannerParams = 'moveit_msgs/SetPlannerParams'
        moveit_msgs_SetPlannerParamsRequest = 'moveit_msgs/SetPlannerParamsRequest'
        moveit_msgs_SetPlannerParamsResponse = 'moveit_msgs/SetPlannerParamsResponse'
        moveit_msgs_TrajectoryConstraints = 'moveit_msgs/TrajectoryConstraints'
        moveit_msgs_VisibilityConstraint = 'moveit_msgs/VisibilityConstraint'
        moveit_msgs_WorkspaceParameters = 'moveit_msgs/WorkspaceParameters'
        ur10_cm_dual_arm_eff_msg = 'ur10_cm/dual_arm_eff_msg'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(112, 1);
                msgList{1} = 'moveit_msgs/AllowedCollisionEntry';
                msgList{2} = 'moveit_msgs/AllowedCollisionMatrix';
                msgList{3} = 'moveit_msgs/ApplyPlanningSceneRequest';
                msgList{4} = 'moveit_msgs/ApplyPlanningSceneResponse';
                msgList{5} = 'moveit_msgs/AttachedCollisionObject';
                msgList{6} = 'moveit_msgs/BoundingVolume';
                msgList{7} = 'moveit_msgs/CheckIfRobotStateExistsInWarehouseRequest';
                msgList{8} = 'moveit_msgs/CheckIfRobotStateExistsInWarehouseResponse';
                msgList{9} = 'moveit_msgs/CollisionObject';
                msgList{10} = 'moveit_msgs/ConstraintEvalResult';
                msgList{11} = 'moveit_msgs/Constraints';
                msgList{12} = 'moveit_msgs/ContactInformation';
                msgList{13} = 'moveit_msgs/CostSource';
                msgList{14} = 'moveit_msgs/DeleteRobotStateFromWarehouseRequest';
                msgList{15} = 'moveit_msgs/DeleteRobotStateFromWarehouseResponse';
                msgList{16} = 'moveit_msgs/DisplayRobotState';
                msgList{17} = 'moveit_msgs/DisplayTrajectory';
                msgList{18} = 'moveit_msgs/ExecuteKnownTrajectoryRequest';
                msgList{19} = 'moveit_msgs/ExecuteKnownTrajectoryResponse';
                msgList{20} = 'moveit_msgs/ExecuteTrajectoryAction';
                msgList{21} = 'moveit_msgs/ExecuteTrajectoryActionFeedback';
                msgList{22} = 'moveit_msgs/ExecuteTrajectoryActionGoal';
                msgList{23} = 'moveit_msgs/ExecuteTrajectoryActionResult';
                msgList{24} = 'moveit_msgs/ExecuteTrajectoryFeedback';
                msgList{25} = 'moveit_msgs/ExecuteTrajectoryGoal';
                msgList{26} = 'moveit_msgs/ExecuteTrajectoryResult';
                msgList{27} = 'moveit_msgs/GetCartesianPathRequest';
                msgList{28} = 'moveit_msgs/GetCartesianPathResponse';
                msgList{29} = 'moveit_msgs/GetConstraintAwarePositionIKRequest';
                msgList{30} = 'moveit_msgs/GetConstraintAwarePositionIKResponse';
                msgList{31} = 'moveit_msgs/GetKinematicSolverInfoRequest';
                msgList{32} = 'moveit_msgs/GetKinematicSolverInfoResponse';
                msgList{33} = 'moveit_msgs/GetMotionPlanRequest';
                msgList{34} = 'moveit_msgs/GetMotionPlanResponse';
                msgList{35} = 'moveit_msgs/GetPlannerParamsRequest';
                msgList{36} = 'moveit_msgs/GetPlannerParamsResponse';
                msgList{37} = 'moveit_msgs/GetPlanningSceneRequest';
                msgList{38} = 'moveit_msgs/GetPlanningSceneResponse';
                msgList{39} = 'moveit_msgs/GetPositionFKRequest';
                msgList{40} = 'moveit_msgs/GetPositionFKResponse';
                msgList{41} = 'moveit_msgs/GetPositionIKRequest';
                msgList{42} = 'moveit_msgs/GetPositionIKResponse';
                msgList{43} = 'moveit_msgs/GetRobotStateFromWarehouseRequest';
                msgList{44} = 'moveit_msgs/GetRobotStateFromWarehouseResponse';
                msgList{45} = 'moveit_msgs/GetStateValidityRequest';
                msgList{46} = 'moveit_msgs/GetStateValidityResponse';
                msgList{47} = 'moveit_msgs/Grasp';
                msgList{48} = 'moveit_msgs/GraspPlanningRequest';
                msgList{49} = 'moveit_msgs/GraspPlanningResponse';
                msgList{50} = 'moveit_msgs/GripperTranslation';
                msgList{51} = 'moveit_msgs/JointConstraint';
                msgList{52} = 'moveit_msgs/JointLimits';
                msgList{53} = 'moveit_msgs/KinematicSolverInfo';
                msgList{54} = 'moveit_msgs/LinkPadding';
                msgList{55} = 'moveit_msgs/LinkScale';
                msgList{56} = 'moveit_msgs/ListRobotStatesInWarehouseRequest';
                msgList{57} = 'moveit_msgs/ListRobotStatesInWarehouseResponse';
                msgList{58} = 'moveit_msgs/LoadMapRequest';
                msgList{59} = 'moveit_msgs/LoadMapResponse';
                msgList{60} = 'moveit_msgs/MotionPlanDetailedResponse';
                msgList{61} = 'moveit_msgs/MotionPlanRequest';
                msgList{62} = 'moveit_msgs/MotionPlanResponse';
                msgList{63} = 'moveit_msgs/MoveGroupAction';
                msgList{64} = 'moveit_msgs/MoveGroupActionFeedback';
                msgList{65} = 'moveit_msgs/MoveGroupActionGoal';
                msgList{66} = 'moveit_msgs/MoveGroupActionResult';
                msgList{67} = 'moveit_msgs/MoveGroupFeedback';
                msgList{68} = 'moveit_msgs/MoveGroupGoal';
                msgList{69} = 'moveit_msgs/MoveGroupResult';
                msgList{70} = 'moveit_msgs/MoveItErrorCodes';
                msgList{71} = 'moveit_msgs/ObjectColor';
                msgList{72} = 'moveit_msgs/OrientationConstraint';
                msgList{73} = 'moveit_msgs/OrientedBoundingBox';
                msgList{74} = 'moveit_msgs/PickupAction';
                msgList{75} = 'moveit_msgs/PickupActionFeedback';
                msgList{76} = 'moveit_msgs/PickupActionGoal';
                msgList{77} = 'moveit_msgs/PickupActionResult';
                msgList{78} = 'moveit_msgs/PickupFeedback';
                msgList{79} = 'moveit_msgs/PickupGoal';
                msgList{80} = 'moveit_msgs/PickupResult';
                msgList{81} = 'moveit_msgs/PlaceAction';
                msgList{82} = 'moveit_msgs/PlaceActionFeedback';
                msgList{83} = 'moveit_msgs/PlaceActionGoal';
                msgList{84} = 'moveit_msgs/PlaceActionResult';
                msgList{85} = 'moveit_msgs/PlaceFeedback';
                msgList{86} = 'moveit_msgs/PlaceGoal';
                msgList{87} = 'moveit_msgs/PlaceLocation';
                msgList{88} = 'moveit_msgs/PlaceResult';
                msgList{89} = 'moveit_msgs/PlannerInterfaceDescription';
                msgList{90} = 'moveit_msgs/PlannerParams';
                msgList{91} = 'moveit_msgs/PlanningOptions';
                msgList{92} = 'moveit_msgs/PlanningScene';
                msgList{93} = 'moveit_msgs/PlanningSceneComponents';
                msgList{94} = 'moveit_msgs/PlanningSceneWorld';
                msgList{95} = 'moveit_msgs/PositionConstraint';
                msgList{96} = 'moveit_msgs/PositionIKRequest';
                msgList{97} = 'moveit_msgs/QueryPlannerInterfacesRequest';
                msgList{98} = 'moveit_msgs/QueryPlannerInterfacesResponse';
                msgList{99} = 'moveit_msgs/RenameRobotStateInWarehouseRequest';
                msgList{100} = 'moveit_msgs/RenameRobotStateInWarehouseResponse';
                msgList{101} = 'moveit_msgs/RobotState';
                msgList{102} = 'moveit_msgs/RobotTrajectory';
                msgList{103} = 'moveit_msgs/SaveMapRequest';
                msgList{104} = 'moveit_msgs/SaveMapResponse';
                msgList{105} = 'moveit_msgs/SaveRobotStateToWarehouseRequest';
                msgList{106} = 'moveit_msgs/SaveRobotStateToWarehouseResponse';
                msgList{107} = 'moveit_msgs/SetPlannerParamsRequest';
                msgList{108} = 'moveit_msgs/SetPlannerParamsResponse';
                msgList{109} = 'moveit_msgs/TrajectoryConstraints';
                msgList{110} = 'moveit_msgs/VisibilityConstraint';
                msgList{111} = 'moveit_msgs/WorkspaceParameters';
                msgList{112} = 'ur10_cm/dual_arm_eff_msg';
            end
            
            messageList = msgList;
        end
        
        function serviceList = getServiceList
            %getServiceList Generate a cell array with all service types.
            %   The list will be sorted alphabetically.
            
            persistent svcList
            if isempty(svcList)
                svcList = cell(22, 1);
                svcList{1} = 'moveit_msgs/ApplyPlanningScene';
                svcList{2} = 'moveit_msgs/CheckIfRobotStateExistsInWarehouse';
                svcList{3} = 'moveit_msgs/DeleteRobotStateFromWarehouse';
                svcList{4} = 'moveit_msgs/ExecuteKnownTrajectory';
                svcList{5} = 'moveit_msgs/GetCartesianPath';
                svcList{6} = 'moveit_msgs/GetConstraintAwarePositionIK';
                svcList{7} = 'moveit_msgs/GetKinematicSolverInfo';
                svcList{8} = 'moveit_msgs/GetMotionPlan';
                svcList{9} = 'moveit_msgs/GetPlannerParams';
                svcList{10} = 'moveit_msgs/GetPlanningScene';
                svcList{11} = 'moveit_msgs/GetPositionFK';
                svcList{12} = 'moveit_msgs/GetPositionIK';
                svcList{13} = 'moveit_msgs/GetRobotStateFromWarehouse';
                svcList{14} = 'moveit_msgs/GetStateValidity';
                svcList{15} = 'moveit_msgs/GraspPlanning';
                svcList{16} = 'moveit_msgs/ListRobotStatesInWarehouse';
                svcList{17} = 'moveit_msgs/LoadMap';
                svcList{18} = 'moveit_msgs/QueryPlannerInterfaces';
                svcList{19} = 'moveit_msgs/RenameRobotStateInWarehouse';
                svcList{20} = 'moveit_msgs/SaveMap';
                svcList{21} = 'moveit_msgs/SaveRobotStateToWarehouse';
                svcList{22} = 'moveit_msgs/SetPlannerParams';
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            serviceList = svcList;
        end
        
        function actionList = getActionList
            %getActionList Generate a cell array with all action types.
            %   The list will be sorted alphabetically.
            
            persistent actList
            if isempty(actList)
                actList = cell(4, 1);
                actList{1} = 'moveit_msgs/ExecuteTrajectory';
                actList{2} = 'moveit_msgs/MoveGroup';
                actList{3} = 'moveit_msgs/Pickup';
                actList{4} = 'moveit_msgs/Place';
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            actionList = actList;
        end
    end
end
