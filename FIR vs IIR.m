clc; clear; close all;
% Problem - 20
%% ---- Filter definitions ----
% FIR filter: symmetric coefficients -> guarantees linear phase
b_fir = [0.25, 0.5, 0.25];
a_fir = 1;

% IIR filter: same numerator, with feedback -> poles at z = 0.3, 0.2
% A(z) = 1 - 0.5 z^-1 + 0.06 z^-2
b_iir = [0.25, 0.5, 0.25];
a_iir = [1, -0.5, 0.06];

N = 512;   % number of frequency points for freqz/grpdelay

%% ---- Part A: Response ----
% Impulse response
figure;
subplot(1,2,1);
impz(b_fir, a_fir, 8);
title('FIR Impulse Response h(n)');

subplot(1,2,2);
impz(b_iir, a_iir, 8);
title('IIR Impulse Response h(n)');

% Magnitude response
[H_fir, w] = freqz(b_fir, a_fir, N);
[H_iir, ~] = freqz(b_iir, a_iir, N);

figure;
plot(w, abs(H_fir), 'b-', 'LineWidth', 1.5); hold on;
plot(w, abs(H_iir), 'r-', 'LineWidth', 1.5);
title('Magnitude Response: FIR vs IIR');
xlabel('Frequency (rad/sample)'); ylabel('|H(e^{j\omega})|');
legend('FIR', 'IIR'); grid on;

%% ---- Part B: Stability ----
figure;
subplot(1,2,1);
zplane(b_fir, a_fir);
title('FIR: Pole-Zero Plot');

subplot(1,2,2);
zplane(b_iir, a_iir);
title('IIR: Pole-Zero Plot');

poles_fir = roots(a_fir);   % empty -> no feedback
poles_iir = roots(a_iir);

fprintf('--- FIR Filter ---\n');
if isempty(poles_fir)
    fprintf('No feedback -> poles trivially at origin -> STABLE\n');
end

fprintf('\n--- IIR Filter ---\n');
disp('Poles:'); disp(poles_iir);
if all(abs(poles_iir) < 1)
    fprintf('All |poles| < 1 -> STABLE\n');
else
    fprintf('Some |poles| >= 1 -> UNSTABLE\n');
end

%% ---- Part C: Phase characteristics ----
figure;
subplot(2,1,1);
plot(w, unwrap(angle(H_fir)), 'b-', 'LineWidth', 1.5); hold on;
plot(w, unwrap(angle(H_iir)), 'r-', 'LineWidth', 1.5);
title('Phase Response: FIR vs IIR');
xlabel('Frequency (rad/sample)'); ylabel('Phase (radians)');
legend('FIR', 'IIR'); grid on;

[gd_fir, w_gd] = grpdelay(b_fir, a_fir, N);
[gd_iir, ~]    = grpdelay(b_iir, a_iir, N);

subplot(2,1,2);
plot(w_gd, gd_fir, 'b-', 'LineWidth', 1.5); hold on;
plot(w_gd, gd_iir, 'r-', 'LineWidth', 1.5);
title('Group Delay: FIR vs IIR');
xlabel('Frequency (rad/sample)'); ylabel('Group delay (samples)');
legend('FIR (constant -> linear phase)', 'IIR (varies -> nonlinear phase)');
grid on;

fprintf('\n--- Group delay summary ---\n');
fprintf('FIR group delay range: [%.4f, %.4f] samples\n', min(gd_fir), max(gd_fir));
fprintf('IIR group delay range: [%.4f, %.4f] samples\n', min(gd_iir), max(gd_iir));
