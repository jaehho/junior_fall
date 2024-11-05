Problem Set III: Information Theory
clc; clear; close all;
Problem 1
disp('Problem 1')

% Define symbols and respective probabilities
symbols =   {'a',  'b',  'c',  'd',  'e',  'f',  'g',  'h' };
p       =   [0.24, 0.21, 0.18, 0.15, 0.07, 0.06, 0.05, 0.04];

%%% Part (a)
Part (a)
disp('Part (a)')
% Codeword lengths
l = ceil(-log2(p));

% Kraft sum
kraft_sum = sum(2.^(-l));

disp('Codeword lengths (l):');
disp(l);

% Show that Kraft inequality is satisfied
disp('Kraft Inequality:');
disp([num2str(kraft_sum) ' <= 1']);
if kraft_sum <= 1
    disp('The code lengths satisfy the Kraft inequality.');
else
    disp('The code lengths do not satisfy the Kraft inequality.');
end
Part (b)
disp('Part (b)')
% Entropy H(X)
H_X = sum(-p .* log2(p));

% Average code length L_bar
L_bar = sum(p .* l);

disp('Entropy H(X):');
disp(H_X);
disp('Average code length L_bar:');
disp(L_bar);

% Verify the inequality H(X) <= L_bar < H(X) + 1
disp('H(X) <= L_bar < H(X) + 1')
disp([num2str(H_X) ' <= ' num2str(L_bar) ' < ' num2str(H_X + 1)]);
if H_X <= L_bar && L_bar < H_X + 1
    disp('The inequality H(X) <= L_bar < H(X) + 1 is satisfied.');
else
    disp('The inequality H(X) <= L_bar < H(X) + 1 is not satisfied.');
end

Problem 2
disp('Problem 2')

% Code Tree
img = imread('Code Tree.jpeg');
imshow(img);
title('Huffman Code Tree');

% Symbols         a     b     c      d      e       f       g        h
huffman_codes = {'00', '10', '010', '011', '1100', '1101', '1110', '1111'};

% Calculate Huffman code lengths
huffman_lengths = cellfun(@length, huffman_codes);

% Calculate -log2(p) for each probability
neg_log2_p = -log2(p);

% Code Table
code_table = table(symbols', p', huffman_codes', huffman_lengths', round(neg_log2_p, 2)', l', ...
                   'VariableNames', {'Symbol', 'Probability', 'Code', 'Length', '-log2(p)', 'ceil(-log2(p))'});
disp('Huffman Code Table:');
disp(code_table);

% Kraft inequality for Huffman codes
kraft_sum_huffman = sum(2.^(-huffman_lengths));
disp('Kraft inequality (Huffman):');
disp([num2str(kraft_sum_huffman) ' <= 1']);
if kraft_sum_huffman <= 1
    disp('The Huffman code lengths satisfy the Kraft inequality.');
else
    disp('The Huffman code lengths do not satisfy the Kraft inequality.');
end

% Average code length L_bar for the Huffman code
L_bar_huffman = sum(p .* huffman_lengths);
disp('Average code length L_bar for Huffman code:');
disp(L_bar_huffman)

% Verify the inequality H(X) <= L_bar < H(X) + 1
disp('H(X) <= L_bar < H(X) + 1')
disp([num2str(H_X) ' <= ' num2str(L_bar_huffman) ' < ' num2str(H_X + 1)]);
if H_X <= L_bar_huffman && L_bar_huffman < H_X + 1
    disp('The inequality H(X) <= L_bar < H(X) + 1 is satisfied for the Huffman code.');
else
    disp('The inequality H(X) <= L_bar < H(X) + 1 is not satisfied for the Huffman code.');
end
Problem 3
disp('Problem 3')
Part (a)
disp('Part (a)')

three_binit_sequences = {'000',     '001',     '010', '011', '100',     '101',     '110', '111'};
three_binit_probs     = [0.24*0.57, 0.24*0.43, 0.18,  0.15,  0.21*0.57, 0.21*0.43, 0.13,  0.09];
% sum_three_binit_probs = sum(three_binit_probs); % Check the sum of
% probabilities is 1

disp('3-Binit Sequence Probabilities:')
results_table = table(three_binit_sequences', round(three_binit_probs, 2)', ...
                      'VariableNames', {'3_Binit_Sequence', 'Probability'});
disp(results_table);
Part (b)
disp('Part (b)')

%% Entropy H(Y3)
% Marginal probabilities for Y3 (0 or 1)
p_Y3_0 = sum(three_binit_probs([1, 3, 5, 7])); % Sequences where Y3 = 0
p_Y3_1 = sum(three_binit_probs([2, 4, 6, 8])); % Sequences where Y3 = 1

H_Y3 = (-p_Y3_0 * log2(p_Y3_0) - p_Y3_1 * log2(p_Y3_1));
disp('Entropy H(Y3):')
disp(H_Y3)

%% Entropy H(Y3 | Y2)
% Marginal probabilities for Y2 (0 or 1)
p_Y2_0 = sum(three_binit_probs([1, 2, 7, 8])); % Sequences where Y2 = 0
p_Y2_1 = sum(three_binit_probs([3, 4, 5, 6])); % Sequences where Y2 = 1

% Conditional probabilities for Y3 given Y2
p_Y3_0_given_Y2_0 = sum(three_binit_probs([1, 7])) / p_Y2_0;
p_Y3_1_given_Y2_0 = sum(three_binit_probs([2, 8])) / p_Y2_0;
p_Y3_0_given_Y2_1 = sum(three_binit_probs([3, 5])) / p_Y2_1;
p_Y3_1_given_Y2_1 = sum(three_binit_probs([4, 6])) / p_Y2_1;

H_Y3_given_Y2 = p_Y2_0 * (-p_Y3_0_given_Y2_0 * log2(p_Y3_0_given_Y2_0) - p_Y3_1_given_Y2_0 * log2(p_Y3_1_given_Y2_0)) ...
              + p_Y2_1 * (-p_Y3_0_given_Y2_1 * log2(p_Y3_0_given_Y2_1) - p_Y3_1_given_Y2_1 * log2(p_Y3_1_given_Y2_1));
disp('Conditional Entropy H(Y3 | Y2):')
disp(H_Y3_given_Y2)

%% Entropy H(Y3 | Y1, Y2)
% Joint probabilities of each (Y1, Y2) pair
p_Y1Y2_00 = sum(three_binit_probs([1, 2])); % (Y1, Y2) = (0, 0)
p_Y1Y2_01 = sum(three_binit_probs([3, 4])); % (Y1, Y2) = (0, 1)
p_Y1Y2_10 = sum(three_binit_probs([5, 6])); % (Y1, Y2) = (1, 0)
p_Y1Y2_11 = sum(three_binit_probs([7, 8])); % (Y1, Y2) = (1, 1)

% Conditional probabilities for Y3 given each (Y1, Y2) combination
% (Y1, Y2) = (0, 0)
p_Y3_0_given_Y1Y2_00 = three_binit_probs(1) / p_Y1Y2_00;
p_Y3_1_given_Y1Y2_00 = three_binit_probs(2) / p_Y1Y2_00;
H_Y3_given_Y1Y2_00 = (-p_Y3_0_given_Y1Y2_00 * log2(p_Y3_0_given_Y1Y2_00) - ...
                       p_Y3_1_given_Y1Y2_00 * log2(p_Y3_1_given_Y1Y2_00));

% (Y1, Y2) = (0, 1)
p_Y3_0_given_Y1Y2_01 = three_binit_probs(3) / p_Y1Y2_01;
p_Y3_1_given_Y1Y2_01 = three_binit_probs(4) / p_Y1Y2_01;
H_Y3_given_Y1Y2_01 = (-p_Y3_0_given_Y1Y2_01 * log2(p_Y3_0_given_Y1Y2_01) - ...
                       p_Y3_1_given_Y1Y2_01 * log2(p_Y3_1_given_Y1Y2_01));

% (Y1, Y2) = (1, 0)
p_Y3_0_given_Y1Y2_10 = three_binit_probs(5) / p_Y1Y2_10;
p_Y3_1_given_Y1Y2_10 = three_binit_probs(6) / p_Y1Y2_10;
H_Y3_given_Y1Y2_10 = (-p_Y3_0_given_Y1Y2_10 * log2(p_Y3_0_given_Y1Y2_10) - ...
                       p_Y3_1_given_Y1Y2_10 * log2(p_Y3_1_given_Y1Y2_10));

% (Y1, Y2) = (1, 1)
p_Y3_0_given_Y1Y2_11 = three_binit_probs(7) / p_Y1Y2_11;
p_Y3_1_given_Y1Y2_11 = three_binit_probs(8) / p_Y1Y2_11;
H_Y3_given_Y1Y2_11 = (-p_Y3_0_given_Y1Y2_11 * log2(p_Y3_0_given_Y1Y2_11) - ...
                       p_Y3_1_given_Y1Y2_11 * log2(p_Y3_1_given_Y1Y2_11));

% Combine the conditional entropies weighted by the probability of each (Y1, Y2) pair
H_Y3_given_Y1Y2 = p_Y1Y2_00 * (-p_Y3_0_given_Y1Y2_00 * log2(p_Y3_0_given_Y1Y2_00) - ...
                                p_Y3_1_given_Y1Y2_00 * log2(p_Y3_1_given_Y1Y2_00)) + ...
                  p_Y1Y2_01 * (-p_Y3_0_given_Y1Y2_01 * log2(p_Y3_0_given_Y1Y2_01) - ...
                                p_Y3_1_given_Y1Y2_01 * log2(p_Y3_1_given_Y1Y2_01)) + ...
                  p_Y1Y2_10 * (-p_Y3_0_given_Y1Y2_10 * log2(p_Y3_0_given_Y1Y2_10) - ...
                                p_Y3_1_given_Y1Y2_10 * log2(p_Y3_1_given_Y1Y2_10)) + ...
                  p_Y1Y2_11 * (-p_Y3_0_given_Y1Y2_11 * log2(p_Y3_0_given_Y1Y2_11) - ...
                                p_Y3_1_given_Y1Y2_11 * log2(p_Y3_1_given_Y1Y2_11));

% Display the result
disp('Conditional Entropy H(Y3 | Y1, Y2):')
disp(H_Y3_given_Y1Y2)
Part (c)
disp('Part (c)')
disp('H(Y3) > H(Y3 | Y2) > H(Y3 | Y1, Y2)')
disp(num2str(H_Y3) + ">" + num2str(H_Y3_given_Y2) + ">" + num2str(H_Y3_given_Y1Y2))
if H_Y3 >= H_Y3_given_Y2 && H_Y3_given_Y2 >= H_Y3_given_Y1Y2
    disp('This is a decreasing sequence');
else
    disp('This is not a decreasing sequence');
end