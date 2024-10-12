% MATLAB script to plot input and output of poly1 function

% Define the input vector h and the number of components M
h = [1, 2, 3, 4, 5, 6, 7, 8, 9];  % Example input vector
M = 3;  % Number of polyphase components

% Call the poly1 function
E = poly1(h, M);

% Plot the input signal
figure;
subplot(2, 1, 1);  % Two plots: input and output
stem(h, 'filled');  % Stem plot for discrete signal representation
title('Input Vector h');
xlabel('Index');
ylabel('Value');
grid on;

% Plot the output polyphase components
subplot(2, 1, 2);  % Second plot for output
stem(E, 'filled');  % Stem plot for the polyphase components flattened
title('Polyphase Decomposition Output (E)');
xlabel('Index');
ylabel('Value');
grid on;

% Display the polyphase decomposition matrix E
disp('Polyphase decomposition matrix (E):');
disp(E);

% poly1 function definition
function E = poly1(h, M)
    % Ensure h has a length multiple of M by zero-padding
    h = [h, zeros(1, ceil(length(h)/M)*M-length(h))];
    
    % Perform type I polyphase decomposition
    E = reshape(h, M, length(h)/M);
end
