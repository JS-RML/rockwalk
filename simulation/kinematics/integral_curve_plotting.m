clear all
close all
set(0,'defaultaxesfontsize',20);
set(0,'defaulttextfontsize',20);

load vector_field_pos.mat
load vector_field_neg.mat
load params.mat

%--------------------------------------------------------------------------

anchor_point = [0;0];
%Integration Params
steps = 10;
step_length = 0.005;


drawAnnulus(del_lb, del_ub);


for del_query = linspace(del_lb, del_ub-0.005, 15)

    start_pt = [del_query, 0];

    [stream_x, stream_y, current_stream_pt] = flowFieldCCW(del_lb, start_pt,...
    X_ann_pos+anchor_point(1), Y_ann_pos+anchor_point(2), U_ann_pos, V_ann_pos,...
    X_ann_neg+anchor_point(1), Y_ann_neg+anchor_point(2), U_ann_neg, V_ann_neg,...
    anchor_point,...
    steps, step_length);

    plot(stream_x, stream_y, 'LineWidth', 1.40, 'Color', [.1 .1 .1])
    hold on
end




function [stream_x, stream_y, current_stream_pt] = flowFieldCW(del_lb, start_pt,...
        x_curve_set_pos, y_curve_set_pos, vector_field_u_pos, vector_field_v_pos,...
        x_curve_set_neg, y_curve_set_neg, vector_field_u_neg, vector_field_v_neg,...
        anchor_point,...
        steps, step_length)

    start_pt = double(start_pt);
    del_lb = double(del_lb);

    stream_y = zeros(1, ceil(steps/step_length));
    stream_x = zeros(1, ceil(steps/step_length));
    
    stream_x(1,1) = start_pt(1);
    stream_y(1,1) = start_pt(2);

    
    current_stream_pt = start_pt';


    interpolant_u = scatteredInterpolant(x_curve_set_neg(:), y_curve_set_neg(:), -vector_field_u_neg(:), 'natural', 'none');
    interpolant_v = scatteredInterpolant(x_curve_set_neg(:), y_curve_set_neg(:), -vector_field_v_neg(:), 'natural', 'none');
    
    current_direction(1,1) = interpolant_u(start_pt(1), start_pt(2));
    current_direction(2,1) = interpolant_v(start_pt(1), start_pt(2));

    
    epsilon = 0.005;
    dir = 1;
    
    for stp = 2:ceil(steps/step_length)

        
        
        next_stream_pt = current_stream_pt + step_length*current_direction;

        next_vector_u = interpolant_u(next_stream_pt(1,1), next_stream_pt(2,1));
        next_vector_v = interpolant_v(next_stream_pt(1,1), next_stream_pt(2,1));
        


        next_direction = [next_vector_u; next_vector_v];

        stream_x(1, stp) = next_stream_pt(1,1);
        stream_y(1, stp) = next_stream_pt(2,1);

        current_stream_pt = next_stream_pt;
        current_direction = next_direction;
        
        
        if norm(current_stream_pt-anchor_point) < del_lb + epsilon
            interpolant_u = scatteredInterpolant(x_curve_set_pos(:), y_curve_set_pos(:), -vector_field_u_pos(:), 'natural', 'none');
            interpolant_v = scatteredInterpolant(x_curve_set_pos(:), y_curve_set_pos(:), -vector_field_v_pos(:), 'natural', 'none');
            
            dir = -1;
        end
        
        if dir == -1 && norm(current_stream_pt-anchor_point) > norm(start_pt-anchor_point')
            break
        end
       
    end
    
    stream_x = stream_x(1, 1:stp);
    stream_y = stream_y(1, 1:stp);
        
end



function [stream_x, stream_y, current_stream_pt] = flowFieldCCW(del_lb, start_pt,...
        x_curve_set_pos, y_curve_set_pos, vector_field_u_pos, vector_field_v_pos,...
        x_curve_set_neg, y_curve_set_neg, vector_field_u_neg, vector_field_v_neg,...
        anchor_point,...
        steps, step_length)
    
    start_pt = double(start_pt);
    del_lb = double(del_lb);

    stream_y = zeros(1, ceil(steps/step_length));
    stream_x = zeros(1, ceil(steps/step_length));
    
    stream_x(1,1) = start_pt(1);
    stream_y(1,1) = start_pt(2);

    
    current_stream_pt = start_pt';


    interpolant_u = scatteredInterpolant(x_curve_set_pos(:), y_curve_set_pos(:), vector_field_u_pos(:), 'natural', 'none');
    interpolant_v = scatteredInterpolant(x_curve_set_pos(:), y_curve_set_pos(:), vector_field_v_pos(:), 'natural', 'none');
    
    current_direction(1,1) = interpolant_u(start_pt(1), start_pt(2));
    current_direction(2,1) = interpolant_v(start_pt(1), start_pt(2));

    
    epsilon = 0.005;
    dir = 1;
    
    for stp = 2:ceil(steps/step_length)

        
        
        next_stream_pt = current_stream_pt + step_length*current_direction;

        next_vector_u = interpolant_u(next_stream_pt(1,1), next_stream_pt(2,1));
        next_vector_v = interpolant_v(next_stream_pt(1,1), next_stream_pt(2,1));
        


        next_direction = [next_vector_u; next_vector_v];

        stream_x(1, stp) = next_stream_pt(1,1);
        stream_y(1, stp) = next_stream_pt(2,1);

        current_stream_pt = next_stream_pt;
        current_direction = next_direction;
        
        
        if norm(current_stream_pt-anchor_point) < del_lb + epsilon
            interpolant_u = scatteredInterpolant(x_curve_set_neg(:), y_curve_set_neg(:), vector_field_u_neg(:), 'natural', 'none');
            interpolant_v = scatteredInterpolant(x_curve_set_neg(:), y_curve_set_neg(:), vector_field_v_neg(:), 'natural', 'none');
            
            dir = -1;
        end
        
        if dir == -1 && norm(current_stream_pt-anchor_point) > norm(start_pt-anchor_point')
            break
        end
       
    end
        
    stream_x = stream_x(1, 1:stp);
    stream_y = stream_y(1, 1:stp);
        
end







function drawAnnulus(del_lb,del_ub)

    th = 0:pi/50:2*pi;

    x_unit_inn = del_lb * cos(th);
    y_unit_inn = del_lb * sin(th);

    x_unit_out = del_ub * cos(th);
    y_unit_out = del_ub * sin(th);

    inn_circ = plot(x_unit_inn, y_unit_inn, ...
        'LineWidth', 2.5, ...
        'Color', 'k');
    
    hold on 
    
    out_circ = plot(x_unit_out, y_unit_out, ...
        'LineWidth', 2.5, ...
        'Color', 'k');
    
    hold on

%     Draw line

%     line_lb_ub = linspace(del_lb, del_ub, 50);
% 
%     plot(line_lb_ub, zeros(1,50), ....
%         'LineWidth', 2.5, ...
%         'Color', 'k')

    pbaspect([1 1 1])
    hold on

end
