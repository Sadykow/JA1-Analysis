## Methodology (Time-series models implementation)
### Intro paragraph (Managing input data)
1) Intro to section with usual ML process outline.
2) Purpose of the article. Prototype existing models on low-power devices.
### Battery Data for training and validation (Dataset description and generator)
1) Battery data description and overview. **Table III**
   > > Need to take another look on the explanation why we think that data obtaind from a cycler machine do not math with theirs, even though it is the same cycler and same batteries. Marked as Red text.
2) How to work with battery data and which were selected.
   > > Interpolation and noising goes here now
3) State of charge calculation with equations.
### Dataset description and generator
1) How the RNN manages input data, and how the matrix looks like.
> (1) Table 3.2, what are the length of the input sequences? Details are needed on the extensions. For example, how big is the model ensemble? How is the attention mechanism formulated? This table should also include citations to the paper that the method is based on
> > Not a place for details, sections further do that. Citations added to extensions

> (1) P36, “It makes the following approach applicable to almost any type of time series dependant problem [26]. “, the paper you cite here [26 is “Battery state-of-charge estimator using the SVM technique,”, how is this citation supporting the value of RNNs for time series estimation?
> > It is not support, it's just not my words. I just removed this sentence with lack of need.

2) Describe the size of the history selection.
> (1) “Both stateful and stateless methods fall for input samples’ impact and their length”, unclear, what is meant by “fall” here?
> > Repeatence in case of thesis. Need to decide what to do with it.

///////////////////////////////////////////////
> (1) P50 “The range of 20 to 50 was used as a training and testing dataset. “, unclear, do you mean that all data is
in this temperature range? Or is the range different between testing and training?

> (1) P50, “Each method went through a single cycling profile and was tested against the other two, as per Mamo et al. [30] research.“, unclear. Do you mean that models were trained on one profile, and tested on the other two? Why not train on two and test on one? Or train on one, use a second as a validation set, and test on the third?

///////////////////////////////////////////////


1) Windowing technique, batching and normalisation. **Figure 4**
> (1) P37, “ The statefulness of a model preserves the state at index i to the same index in the next batch [ref to the document will not hurt].“, missing reference
> > Reference has been restored. I can't believe I left a comment there instead of proper reference and submitted for examination. 

> (1) P39, Figure 3.2. (JA: Figure 4) What is the sampling rate? I assume that it’s 1 Hz, but it would be good to state this.
> > Explanation kept, 1Hz mentioning under capture of the page big plot added

### Model training, validation and testing metrics functions
1) The evaluation process, how it is done and what it meant to achieve

2) Save/load process to avoid overfitting early

3) Testing procedures explanation and reasoning Algorithm 1

4) Accuracy evaluation explanation with drawings

> (1) “The optimiser selection was based on the derivative calculation algorithms only. “, are you selecting these methods based on the original paper? If not, why the variation?

5) Metrics functions **Table IV**

6) Concluding purpose of the training and ultimate goal of getting so creative
### Hyper-parameters selection
1) Methods and their optimisers

2) Recovery from faults.

3) Betas and Epsilon instead on every optimiser page

4) Layers and neurons

5) The Evaluation process of layers and neurons to get the best set



### Hardware and Software
1) Embedded devices for performance measurements
> (1) P52, The devices used in section 3.2.8 could be summarised in a table to provide an easy to read comparison.
A measurement such as FLOPs (floating point operations per second) for each device would also be of use to
show their computational power.
> > Table was started but removed in the past. This is the calculation I salvaged from old docs
> > Android device: 3GB - RAM, Octa-core 1.3 GHz Cortex-A53, Android 5.1 (6), Chipset: Mediatek MT6753 (28 nm)
GFLOPS table: http://web.eece.maine.edu/~vweaver/group/green_machines.html
R-Pi3B as per Tim Chant:
70.45 GFLOPS / 6.2 GFLOPS/s = 11.36 s
Total model flops / device flops = Time  --->>>>> Time * Device flops = Total model flops
Energy consumption if Voltage and Current from device records not enough
1.36 s/s * 3.7 W / 3,600s = 0.0116 Wh/s

2) Model training Framework

3) Final performance tests Figure with computes
> > Update with LYRA charecteristics only. No more training on my GPUs, only performance.

<!-- 

### Hyper-parameters selection
1) What has been done so far by others

2) Learning rate scheduler implementation and work. **Figure 4**

3) Hyper-params for optimisers. **Table 5**

4) Hyper-params for models performed by others

5) Layers and Models we determined to be used. **Figures PLH** -->

