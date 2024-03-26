function generateAndSaveSpectrograms4EachElectrode(dsdata, params, MainElectrode)
%This function serves to generate and save spectrograms of each
%individual electrode after is has undergone the laplacian calculations and
%the downsampling and will save in a folder for easy visualization and
%confirmation of individual electrode activity

    % Define the output folder name
    outputFolder = 'SpectrogramsFromMatlab';
    
    % Check if the output folder exists, if not, create it!
    if ~exist(outputFolder, 'dir')
        mkdir(outputFolder); % This creates the folder if does not exist
    end
    
    % Initialize a counter for the saved figures (just to check that it
    % saves a total of 58 figures, if not something is wrong)
    savedFiguresCount = 0;
    
    % Loop through each electrode to compute and save the spectrogram
    for i = 1:size(dsdata, 1)
        [S, f] = mtspectrumc(dsdata(i, :), params); % Compute spectrogram

        % Create figure without displaying it
        fig = figure('Visible', 'off');
        plot(f, 10*log10(S)); % Plot in dB scale for improved visibility
        title(['Electrode ' MainElectrode{i} ' Spectrogram']);
        xlabel('Frequency (Hz)');
        ylabel('Power/Frequency (dB/Hz)');
        
        % Construct the full file path
        fileName = fullfile(outputFolder, ['Electrode_' MainElectrode{i} '_Spectrogram.png']);
        
        % Save the figure and increment the counter
        saveas(fig, fileName);
        savedFiguresCount = savedFiguresCount + 1;
        
        % Optionally close the figure to conserve memory
        close(fig);
    end
    
    % Display the count of saved figures on the command window
    fprintf('%d figures were saved.\n', savedFiguresCount);
end
