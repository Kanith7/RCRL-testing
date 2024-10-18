function crs()
    % Main function to run the circuit response simulation

    R = input('Enter Resistance (R) in Ohms: ');
    C = input('Enter Capacitance (C) in Farads (for RC circuit): ');
    L = input('Enter Inductance (L) in Henries (for RL circuit): ');
    V0 = input('Enter Initial Voltage (V0) in Volts: ');
    t = linspace(0, 5, 500); % Time from 0 to 5 seconds

    % Plot RC response
    plot_rc_response(R, C, V0, t);
    
    % Plot RL response
    plot_rl_response(R, L, V0, t);
end
%function for plotting rc responce
function plot_rc_response(R, C, V0, t)
   
    % Charging voltage across the capacitor
    V_charge = V0 * (1 - exp(-t / (R * C)));
    % Discharging voltage across the capacitor
    V_discharge = V0 * exp(-t / (R * C));

    % Plotting
    figure;
    plot(t, V_charge, 'b', 'DisplayName', 'Charging Voltage');
    hold on;
    plot(t, V_discharge, 'r--', 'DisplayName', 'Discharging Voltage');
    title('RC Circuit Response');
    xlabel('Time (s)');
    ylabel('Voltage (V)');
    legend;
    grid on;
    hold off;
end

%function for plotting rl response
function plot_rl_response(R, L, V0, t)

    % Charging current through the inductor
    I_charge = (V0 / R) * (1 - exp(-R * t / L));
    % Discharging current through the inductor
    I_discharge = (V0 / R) * exp(-R * t / L);

    % Plotting
    figure;
    plot(t, I_charge, 'g', 'DisplayName', 'Charging Current');
    hold on;
    plot(t, I_discharge, 'm--', 'DisplayName', 'Discharging Current');
    title('RL Circuit Response');
    xlabel('Time (s)');
    ylabel('Current (A)');
    legend;
    grid on;
    hold off;
end
crs();
