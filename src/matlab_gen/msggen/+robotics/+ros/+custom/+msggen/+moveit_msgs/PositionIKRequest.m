classdef PositionIKRequest < robotics.ros.Message
    %PositionIKRequest MATLAB implementation of moveit_msgs/PositionIKRequest
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2018 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'moveit_msgs/PositionIKRequest' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = '9936dc239c90af180ec94a51596c96f2' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        DurationClass = robotics.ros.msg.internal.MessageFactory.getClassForType('duration') % Dispatch to MATLAB class for message type duration
        GeometryMsgsPoseStampedClass = robotics.ros.msg.internal.MessageFactory.getClassForType('geometry_msgs/PoseStamped') % Dispatch to MATLAB class for message type geometry_msgs/PoseStamped
        MoveitMsgsConstraintsClass = robotics.ros.msg.internal.MessageFactory.getClassForType('moveit_msgs/Constraints') % Dispatch to MATLAB class for message type moveit_msgs/Constraints
        MoveitMsgsRobotStateClass = robotics.ros.msg.internal.MessageFactory.getClassForType('moveit_msgs/RobotState') % Dispatch to MATLAB class for message type moveit_msgs/RobotState
    end
    
    properties (Dependent)
        GroupName
        RobotState
        Constraints
        AvoidCollisions
        IkLinkName
        PoseStamped
        Timeout
        Attempts
        IkLinkNames
        PoseStampedVector
    end
    
    properties (Access = protected)
        Cache = struct('RobotState', [], 'Constraints', [], 'PoseStamped', [], 'PoseStampedVector', [], 'Timeout', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'Attempts', 'AvoidCollisions', 'Constraints', 'GroupName', 'IkLinkName', 'IkLinkNames', 'PoseStamped', 'PoseStampedVector', 'RobotState', 'Timeout'} % List of non-constant message properties
        ROSPropertyList = {'attempts', 'avoid_collisions', 'constraints', 'group_name', 'ik_link_name', 'ik_link_names', 'pose_stamped', 'pose_stamped_vector', 'robot_state', 'timeout'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = PositionIKRequest(msg)
            %PositionIKRequest Construct the message object PositionIKRequest
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function groupname = get.GroupName(obj)
            %get.GroupName Get the value for property GroupName
            groupname = char(obj.JavaMessage.getGroupName);
        end
        
        function set.GroupName(obj, groupname)
            %set.GroupName Set the value for property GroupName
            validateattributes(groupname, {'char'}, {}, 'PositionIKRequest', 'GroupName');
            
            obj.JavaMessage.setGroupName(groupname);
        end
        
        function robotstate = get.RobotState(obj)
            %get.RobotState Get the value for property RobotState
            if isempty(obj.Cache.RobotState)
                obj.Cache.RobotState = feval(obj.MoveitMsgsRobotStateClass, obj.JavaMessage.getRobotState);
            end
            robotstate = obj.Cache.RobotState;
        end
        
        function set.RobotState(obj, robotstate)
            %set.RobotState Set the value for property RobotState
            validateattributes(robotstate, {obj.MoveitMsgsRobotStateClass}, {'nonempty', 'scalar'}, 'PositionIKRequest', 'RobotState');
            
            obj.JavaMessage.setRobotState(robotstate.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.RobotState)
                obj.Cache.RobotState.setJavaObject(robotstate.getJavaObject);
            end
        end
        
        function constraints = get.Constraints(obj)
            %get.Constraints Get the value for property Constraints
            if isempty(obj.Cache.Constraints)
                obj.Cache.Constraints = feval(obj.MoveitMsgsConstraintsClass, obj.JavaMessage.getConstraints);
            end
            constraints = obj.Cache.Constraints;
        end
        
        function set.Constraints(obj, constraints)
            %set.Constraints Set the value for property Constraints
            validateattributes(constraints, {obj.MoveitMsgsConstraintsClass}, {'nonempty', 'scalar'}, 'PositionIKRequest', 'Constraints');
            
            obj.JavaMessage.setConstraints(constraints.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Constraints)
                obj.Cache.Constraints.setJavaObject(constraints.getJavaObject);
            end
        end
        
        function avoidcollisions = get.AvoidCollisions(obj)
            %get.AvoidCollisions Get the value for property AvoidCollisions
            avoidcollisions = logical(obj.JavaMessage.getAvoidCollisions);
        end
        
        function set.AvoidCollisions(obj, avoidcollisions)
            %set.AvoidCollisions Set the value for property AvoidCollisions
            validateattributes(avoidcollisions, {'logical', 'numeric'}, {'nonempty', 'scalar'}, 'PositionIKRequest', 'AvoidCollisions');
            
            obj.JavaMessage.setAvoidCollisions(avoidcollisions);
        end
        
        function iklinkname = get.IkLinkName(obj)
            %get.IkLinkName Get the value for property IkLinkName
            iklinkname = char(obj.JavaMessage.getIkLinkName);
        end
        
        function set.IkLinkName(obj, iklinkname)
            %set.IkLinkName Set the value for property IkLinkName
            validateattributes(iklinkname, {'char'}, {}, 'PositionIKRequest', 'IkLinkName');
            
            obj.JavaMessage.setIkLinkName(iklinkname);
        end
        
        function posestamped = get.PoseStamped(obj)
            %get.PoseStamped Get the value for property PoseStamped
            if isempty(obj.Cache.PoseStamped)
                obj.Cache.PoseStamped = feval(obj.GeometryMsgsPoseStampedClass, obj.JavaMessage.getPoseStamped);
            end
            posestamped = obj.Cache.PoseStamped;
        end
        
        function set.PoseStamped(obj, posestamped)
            %set.PoseStamped Set the value for property PoseStamped
            validateattributes(posestamped, {obj.GeometryMsgsPoseStampedClass}, {'nonempty', 'scalar'}, 'PositionIKRequest', 'PoseStamped');
            
            obj.JavaMessage.setPoseStamped(posestamped.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.PoseStamped)
                obj.Cache.PoseStamped.setJavaObject(posestamped.getJavaObject);
            end
        end
        
        function timeout = get.Timeout(obj)
            %get.Timeout Get the value for property Timeout
            if isempty(obj.Cache.Timeout)
                obj.Cache.Timeout = feval(obj.DurationClass, obj.JavaMessage.getTimeout);
            end
            timeout = obj.Cache.Timeout;
        end
        
        function set.Timeout(obj, timeout)
            %set.Timeout Set the value for property Timeout
            validateattributes(timeout, {obj.DurationClass}, {'nonempty', 'scalar'}, 'PositionIKRequest', 'Timeout');
            
            obj.JavaMessage.setTimeout(timeout.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Timeout)
                obj.Cache.Timeout.setJavaObject(timeout.getJavaObject);
            end
        end
        
        function attempts = get.Attempts(obj)
            %get.Attempts Get the value for property Attempts
            attempts = int32(obj.JavaMessage.getAttempts);
        end
        
        function set.Attempts(obj, attempts)
            %set.Attempts Set the value for property Attempts
            validateattributes(attempts, {'numeric'}, {'nonempty', 'scalar'}, 'PositionIKRequest', 'Attempts');
            
            obj.JavaMessage.setAttempts(attempts);
        end
        
        function iklinknames = get.IkLinkNames(obj)
            %get.IkLinkNames Get the value for property IkLinkNames
            javaArray = obj.JavaMessage.getIkLinkNames;
            array = obj.readJavaArray(javaArray, 'char');
            iklinknames = arrayfun(@(x) char(x), array, 'UniformOutput', false);
        end
        
        function set.IkLinkNames(obj, iklinknames)
            %set.IkLinkNames Set the value for property IkLinkNames
            if ~isvector(iklinknames) && isempty(iklinknames)
                % Allow empty [] input
                iklinknames = cell.empty(0,1);
            end
            
            validateattributes(iklinknames, {'cell'}, {'vector'}, 'PositionIKRequest', 'IkLinkNames');
            if any(cellfun(@(x) ~ischar(x), iklinknames))
                error(message('robotics:ros:message:CellArrayStringError', ...
                    'iklinknames'));
            end
            
            javaArray = obj.JavaMessage.getIkLinkNames;
            array = obj.writeJavaArray(iklinknames, javaArray, 'char');
            obj.JavaMessage.setIkLinkNames(array);
        end
        
        function posestampedvector = get.PoseStampedVector(obj)
            %get.PoseStampedVector Get the value for property PoseStampedVector
            if isempty(obj.Cache.PoseStampedVector)
                javaArray = obj.JavaMessage.getPoseStampedVector;
                array = obj.readJavaArray(javaArray, obj.GeometryMsgsPoseStampedClass);
                obj.Cache.PoseStampedVector = feval(obj.GeometryMsgsPoseStampedClass, array);
            end
            posestampedvector = obj.Cache.PoseStampedVector;
        end
        
        function set.PoseStampedVector(obj, posestampedvector)
            %set.PoseStampedVector Set the value for property PoseStampedVector
            if ~isvector(posestampedvector) && isempty(posestampedvector)
                % Allow empty [] input
                posestampedvector = feval([obj.GeometryMsgsPoseStampedClass '.empty'], 0, 1);
            end
            
            validateattributes(posestampedvector, {obj.GeometryMsgsPoseStampedClass}, {'vector'}, 'PositionIKRequest', 'PoseStampedVector');
            
            javaArray = obj.JavaMessage.getPoseStampedVector;
            array = obj.writeJavaArray(posestampedvector, javaArray, obj.GeometryMsgsPoseStampedClass);
            obj.JavaMessage.setPoseStampedVector(array);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.PoseStampedVector)
                obj.Cache.PoseStampedVector = [];
                obj.Cache.PoseStampedVector = obj.PoseStampedVector;
            end
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.RobotState = [];
            obj.Cache.Constraints = [];
            obj.Cache.PoseStamped = [];
            obj.Cache.PoseStampedVector = [];
            obj.Cache.Timeout = [];
        end
        
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Clear any existing cached properties
            cpObj.resetCache;
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.GroupName = obj.GroupName;
            cpObj.AvoidCollisions = obj.AvoidCollisions;
            cpObj.IkLinkName = obj.IkLinkName;
            cpObj.Attempts = obj.Attempts;
            cpObj.IkLinkNames = obj.IkLinkNames;
            
            % Recursively copy compound properties
            cpObj.RobotState = copy(obj.RobotState);
            cpObj.Constraints = copy(obj.Constraints);
            cpObj.PoseStamped = copy(obj.PoseStamped);
            cpObj.Timeout = copy(obj.Timeout);
            cpObj.PoseStampedVector = copy(obj.PoseStampedVector);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.GroupName = strObj.GroupName;
            obj.AvoidCollisions = strObj.AvoidCollisions;
            obj.IkLinkName = strObj.IkLinkName;
            obj.Attempts = strObj.Attempts;
            obj.IkLinkNames = strObj.IkLinkNames;
            obj.RobotState = feval([obj.MoveitMsgsRobotStateClass '.loadobj'], strObj.RobotState);
            obj.Constraints = feval([obj.MoveitMsgsConstraintsClass '.loadobj'], strObj.Constraints);
            obj.PoseStamped = feval([obj.GeometryMsgsPoseStampedClass '.loadobj'], strObj.PoseStamped);
            obj.Timeout = feval([obj.DurationClass '.loadobj'], strObj.Timeout);
            PoseStampedVectorCell = arrayfun(@(x) feval([obj.GeometryMsgsPoseStampedClass '.loadobj'], x), strObj.PoseStampedVector, 'UniformOutput', false);
            obj.PoseStampedVector = vertcat(PoseStampedVectorCell{:});
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.GroupName = obj.GroupName;
            strObj.AvoidCollisions = obj.AvoidCollisions;
            strObj.IkLinkName = obj.IkLinkName;
            strObj.Attempts = obj.Attempts;
            strObj.IkLinkNames = obj.IkLinkNames;
            strObj.RobotState = saveobj(obj.RobotState);
            strObj.Constraints = saveobj(obj.Constraints);
            strObj.PoseStamped = saveobj(obj.PoseStamped);
            strObj.Timeout = saveobj(obj.Timeout);
            strObj.PoseStampedVector = arrayfun(@(x) saveobj(x), obj.PoseStampedVector);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.moveit_msgs.PositionIKRequest.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.moveit_msgs.PositionIKRequest;
            obj.reload(strObj);
        end
    end
end