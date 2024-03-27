function generateAndSaveActualSpectrograms4EachElectrode(dsdata, params, MainElectrode)
    % Define the output folder name
    outputFolder = 'SpectrogramsFromMatlab';
    
    % Check if the output folder exists, if not, create it!
    if ~exist(outputFolder, 'dir')
        mkdir(outputFolder);
    end
    
    % Initialize a counter for the saved figures
    savedFiguresCount = 0;
    
    % Define moving window parameters for the spectrogram
    movingWin = [params.tapers(1) params.tapers(2)/params.Fs]; % Example: [1 0.5] for 1-second windows with 0.5-second overlap
    
    % Loop through each electrode to compute and save the spectrogram
    for i = 1:size(dsdata, 1)
        [S, t, f] = mtspecgramc(dsdata(i, :), movingWin, params); % Compute spectrogram
        
        % Create figure without displaying it
        fig = figure('Visible', 'off');
        imagesc(t, f, 10*log10(S)'); % Plot the spectrogram in dB scale
        axis xy; % Proper orientation
        colormap('jet'); % Color map used to display data
        colorbar; % Shows the color scale
        title(['Electrode ' MainElectrode{i} ' Spectrogram']);
        xlabel('Time (s)');
        ylabel('Frequency (Hz)');
        
        % Construct the full file path
        fileName = fullfile(outputFolder, ['Electrode_' MainElectrode{i} '_Spectrogram.png']);
        
        % Save the figure and increment the counter
        saveas(fig, fileName);
        savedFiguresCount = savedFiguresCount + 1;
        
        % Close the figure to conserve memory
        close(fig);
    end
    
    % Display the count of saved figures on the command window
    fprintf('%d figures were saved.\n', savedFiguresCount);
end
