function plots_main(t,y,data)

    figure()
    subplot(3,2,1)
    plot(t,data.apex_position_values(:,1), 'Color', 'r')
    hold on
    plot(t,data.apex_position_values(:,2), 'Color', 'g')
    hold on
    plot(t,data.apex_position_values(:,3), 'Color', 'b')
    legend({'$x_A$', '$y_A$', '$z_A$'}, 'Orientation','horizontal', 'Interpreter', 'latex')
      
    subplot(3,2,2)
    plot(t,data.ke_values+data.pe_values, 'Color', 'c')
    legend({'$E_{total}$'}, 'Orientation','horizontal', 'Interpreter', 'latex')

    subplot(3,2,[3,4])
    plot(t,y(:,3), 'Color', 'r')
    hold on
    plot(t,y(:,4), 'Color', 'g')
    hold on
    plot(t,y(:,5), 'Color', 'b')
    legend({'\psi', '\theta', '\phi'}, 'Orientation','horizontal')
    
    subplot(3,2,[5,6])
    plot(t, y(:,8), 'r')
    hold on
    plot(t,y(:,10), 'b')
    legend({'$\dot{\psi}$','$\dot{\phi}$'}, 'Orientation', 'horizontal', 'Interpreter', 'latex')    


%-----------------------------------------------------------------------------

%     figure()
%     subplot(2,1,1)
%     title('Acceleration')
%     plot(t,data.sol_values(:,3:5))
%     legend({'$\ddot{\psi}$', '$\ddot{\theta}$', '$\ddot{\phi}$'}, 'Orientation','horizontal', 'Interpreter', 'latex')
%     
%     subplot(2,1,2)
%     title('Constraint Forces')
%     plot(t,data.sol_values(:,6:9))
%     legend()

end
