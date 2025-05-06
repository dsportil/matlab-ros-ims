function myPubNode
%mypubnode Publish joint trajectory messages
%#codegen
node = ros2node("MyPubNode");
% Create publisher 
pub = ros2publisher(node,"/traj","trajectory_msgs/JointTrajectory");

% Create a msg 
msg = ros2message(pub);
if isempty(coder.target)
    msg.joint_names{1} = 'Left';
    msg.joint_names{2} = 'Right';
end
trajMsg = ros2message("trajectory_msgs/JointTrajectoryPoint");
r = ros2rate(node,2);
tic;
while (1)
    msg.header.stamp = ros2time(node,"now");
    x = rand;
    y = rand;
    trajMsg.positions = [x; y; -x; -y]; % Grow variable-size fields in the correct dimension
    msg.points = [trajMsg; trajMsg];    % Grow variable-size fields in the correct dimension
    send(pub,msg);
    waitfor(r);
end
end