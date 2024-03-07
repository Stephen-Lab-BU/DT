eeglabpath = '/Users/daphne/Desktop/StephenLab Rotation/DT/eeglab2024.0';  % New EEGLAB path
addpath(genpath(eeglabpath));  % Adds the new EEGLAB path and its subdirectories to MATLAB's search path
savepath;

Nchannels = length(HDR.label_finalized);  % Number of channels
data_test = eye(Nchannels);  % Identity matrix as test data

data_laplac_test = OthercalculateLaplacian(data_test, HDR.label_finalized, Electrode_neighbors);

chanlocs = struct('labels', HDR.label_finalized);

chanlocs = pop_chanedit(chanlocs, 'lookup', fullfile(eeglabpath, 'plugins', 'dipfit', 'standard_BESA', 'standard-10-5-cap385.elp'));

for i = 1:Nchannels
    figure;  % Create a new figure for each channel's plot
    topoplot(data_laplac_test(:, i), chanlocs);  % Use 'chanlocs' with spatial information
    title(sprintf('Laplacian of Channel %s', HDR.label_finalized{i}));
end

%% Easier visualization and verification
% Create a single figure for all topoplots
figure; 
nrows = ceil(sqrt(Nchannels));  
ncols = ceil(Nchannels / nrows);

% Loop over channels and create subplots
for i = 1:Nchannels
    subplot(nrows, ncols, i);  
    topoplot(data_laplac_test(:, i), chanlocs);  % Make sure 'chanlocs' is correct
    title(HDR.label_finalized{i});  
end

% Maximize figure window and add a super title
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
sgtitle('Laplacian of All Channels');

%%
% For easier visualization and verification
eeglabpath = '/Users/daphne/Desktop/StephenLab Rotation/DT/eeglab2024.0';  % New EEGLAB path
addpath(genpath(eeglabpath));  % Adds the new EEGLAB path and its subdirectories to MATLAB's search path
savepath;

Nchannels = length(HDR.label_finalized);  % Number of channels
data_test = eye(Nchannels);  % Identity matrix as test data

data_laplac_test = OthercalculateLaplacian(data_test, HDR.label_finalized, Electrode_neighbors);

chanlocs = struct('labels', HDR.label_finalized);

chanlocs = pop_chanedit(chanlocs, 'lookup', fullfile(eeglabpath, 'plugins', 'dipfit', 'standard_BESA', 'standard-10-5-cap385.elp'));

figure; 
Nchannels = length(HDR.label_finalized); 
nrows = ceil(sqrt(Nchannels));  
ncols = ceil(Nchannels / nrows);

for i = 1:Nchannels
    subplot(nrows, ncols, i);  
    topoplot(data_laplac_test(:, i), chanlocs);  
    title(HDR.label_finalized{i});  
end

% Improve subplot layout
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);  % Optionally maximize figure window

% Add a title in the bottom left corner of the figure
annotation('textbox', [0.01, 0.01, 0.1, 0.05], 'String', 'Laplacian of All Channels', ...
    'EdgeColor', 'none', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'FontSize', 30);

