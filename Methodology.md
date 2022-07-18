## Methodology (Time-series models implementation)
### Intro paragraph (Managing input data)
1) Intro to section with usual ML process outline.
2) Purpose of the article. Prototype existing models on low-power devices.
### Battery Data for training and validation (Dataset description and generator)
1) Battery data description and overview. **Table III**
2) How to work with battery data and which were selected.
3) State of charge calculation with equations.
### Dataset description and generator
1) How the RNN manages input data and how matrix looks like.
> (1) Table 3.2, what are the length of the input sequences? Details are needed on the extensions. For example, how big is the model ensemble? How is the attention mechanism formulated? This table should also include citations to the paper that the method is based on
> (1) P36, “It makes the following approach applicable to almost any type of time series dependant problem [26]. “, the paper you cite here [26 is “Battery state-of-charge estimator using the SVM technique,”, how is this citation supporting the value of RNNs for time series estimation?

2) Describe the size of the history selection.
> (1) “Both stateful and stateless methods fall for input samples’ impact and their length”, unclear, what is meant by “fall” here?
> (1) P50 “The range of 20 to 50 was used as a training and testing dataset. “, unclear, do you mean that all data is
in this temperature range? Or is the range different between testing and training?
> (1) P50, “Each method went through a single cycling profile and was tested against the other two, as per Mamo et al. [30] research.“, unclear. Do you mean that models were trained on one profile, and tested on the other two? Why not train on two and test on one? Or train on one, use a second as a validation set, and test on the third?

3) Windowing technique, batching and normalisation. **Figure 4**
> (1) “In addition, the normalisation technique is commonly used as a means to speed up the fitting process.“, what sort of normalisation? Min-max normalisation, or standardisation?
> > I must get rid of stateful explanation or I can keep and mention that for the sake of space stateful model did not compite well with stateless models triple times so it was decided remove from discussion and results.
> (1) P37, “ The statefulness of a model preserves the state at index i to the same index in the next batch [ref to the document will not hurt].“, missing reference
> > Reference has been restored. I can't believe I left a comment there instead of proper reference and submitted for examination. 
> (1) P39, Figure 3.2. (JA: Figure 4) What is the sampling rate? I assume that it’s 1 Hz, but it would be good to state this.
### Model training, validation and testing metrics functions
1) Trainig and validation process
TODO: Update with latest Grammarly version

2) Testing stage on 2 drive cycles not part of the training.

3) Final test on all models.
TODO: Update from gramarly using average of 10 models 
> > 3-4) I must bring the Lerning rate scheduler here.

4) Loss functions. **Table II**
TODO: No more loss functions.
> (1) “The optimiser selection was based on the derivative calculation algorithms only. “, are you selecting these methods based on the original paper? If not, why the variation?

5) Metrics functions **Table IV**
### Hardware and Software
1) Three devices hardware description
> (1) P52, The devices used in section 3.2.8 could be summarised in a table to provide an easy to read comparison.
A measurement such as FLOPs (floating point operations per second) for each device would also be of use to
show their computational power.

2) ML framework and Metrics.

3) Training/Testing platform.
TODO: Remove stateful model.
TODO: Update with LYRA charecteristics only. No more training on my GPUs, only performance.