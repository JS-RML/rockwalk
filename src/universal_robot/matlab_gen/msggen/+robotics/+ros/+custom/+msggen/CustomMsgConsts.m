classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2014-2018 The MathWorks, Inc.
    
    properties (Constant)
        ur_msgs_Analog = 'ur_msgs/Analog'
        ur_msgs_Digital = 'ur_msgs/Digital'
        ur_msgs_DualArmEff = 'ur_msgs/DualArmEff'
        ur_msgs_IOStates = 'ur_msgs/IOStates'
        ur_msgs_MasterboardDataMsg = 'ur_msgs/MasterboardDataMsg'
        ur_msgs_RobotStateRTMsg = 'ur_msgs/RobotStateRTMsg'
        ur_msgs_SetIO = 'ur_msgs/SetIO'
        ur_msgs_SetIORequest = 'ur_msgs/SetIORequest'
        ur_msgs_SetIOResponse = 'ur_msgs/SetIOResponse'
        ur_msgs_SetPayload = 'ur_msgs/SetPayload'
        ur_msgs_SetPayloadRequest = 'ur_msgs/SetPayloadRequest'
        ur_msgs_SetPayloadResponse = 'ur_msgs/SetPayloadResponse'
        ur_msgs_ToolDataMsg = 'ur_msgs/ToolDataMsg'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(11, 1);
                msgList{1} = 'ur_msgs/Analog';
                msgList{2} = 'ur_msgs/Digital';
                msgList{3} = 'ur_msgs/DualArmEff';
                msgList{4} = 'ur_msgs/IOStates';
                msgList{5} = 'ur_msgs/MasterboardDataMsg';
                msgList{6} = 'ur_msgs/RobotStateRTMsg';
                msgList{7} = 'ur_msgs/SetIORequest';
                msgList{8} = 'ur_msgs/SetIOResponse';
                msgList{9} = 'ur_msgs/SetPayloadRequest';
                msgList{10} = 'ur_msgs/SetPayloadResponse';
                msgList{11} = 'ur_msgs/ToolDataMsg';
            end
            
            messageList = msgList;
        end
        
        function serviceList = getServiceList
            %getServiceList Generate a cell array with all service types.
            %   The list will be sorted alphabetically.
            
            persistent svcList
            if isempty(svcList)
                svcList = cell(2, 1);
                svcList{1} = 'ur_msgs/SetIO';
                svcList{2} = 'ur_msgs/SetPayload';
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
                actList = cell(0, 1);
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            actionList = actList;
        end
    end
end
