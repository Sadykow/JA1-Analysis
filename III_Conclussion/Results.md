## Performance and Results
# Intro paragraph
1) Intro paragraph with init conditions of data and params.

2) Metrics references

3) Intro to the hyper-parameters calculation, the Evaluation process of layers and neurons to get the best set

4) Intro to the tables of results of the models.

# Hyper-parameters evaluation
1) Details of split, criteria to select and resulted selection.

# Models results overview
1) Intro. Review techniques in the past 3 years.

2) Model 1 - Chemali2017
    2.1) Simple structure, old LSTM. (1lx500n)
    2.2) Adam optimiser
    2.3) 1-(D-C) or 3-D temp ranges
    2.4) Did not overfit or went too far into minumal

3) Model 2 - BinXiao2020
    3.1) Simple structure, new GRU.
    3.2) Ensemple - Nadam(0.001)+Adamax(0.0005) optimiser
    3.3) 1-D only???

4) Model 3 - TadeleMamo2020
    3.1) LSTM+Attention
    3.2) Differential Evolution, we used ADAM
    3.3) Training on 2 profiles - test on 1

5) Model 4 - GaleretJavid202?
    3.1) GRU
    3.2) Non published optimiser RoAdam
    3.3) Was implemented on two frameworks to verify that behavior matches.

6) Model 5 - MengJiao2020
    3.1) LSTM 
    3.2) SGD
    3.3) Identify regions of strugellling to describe

    

# Observations and discussions

> P53, “Despite multiple tests over two cell types, there is no apparent advantage in using LSTM or GRU layers. To determine the actual performance, it will require multiple trained models over a single implementation to average performance results and make a clear statement.“, so why not do this?
> > Because it would take hell of 4-6 months, depending how lucky I am. After all, that's what we did.

> P53, “The advantage of one over another is a simple matter of randomness in the initial training results. The attention layer may not significantly boost the training or accuracy, but it gave a good foundation for further improvements and modifications. “, given the random variation that is acknowledged by the authors, and the lack of multiple trials, how can you say that the attention layers gives a “good foundation for further improvements and modifications.”?
> > That is why it is "foundation", an idea which we can move towards, rather idiotically guess hyper-parames.

> P53, “Since the SoC estimation is not a pure number based behaviour but also a matter of physical, electrical properties, manual adjustment weights, losses or data itself will not bring valuable results “, what is meant here by “manual adjustment”? Do you mean manually adjusting model weights and biases outside of back-prop? (which would make no sense) Or do you mean manual adjustment of the architecture?
> > Manually adjusting architecture, just like attention layer did. After all, that's what we did, added another layer of computation to the training process.

> P53, “Further research and adjustments must be made using a similar principle to improve the trainingprocedure with augmented models“, similar to what?
> > I was refering to the hyperparameters, which we also did.

> P53, “For example, the sigmoid function selection in the model output minimises the possibility of going over 100% or 0% of charge.“, it doesn’t just minimise it, it makes any result outside those bounds impossible
> > yes, we added it long before that.

> P53, “The best performance with Stateful models can be achieved through using a separate training process for charge and discharge“, what is meant by “separate training process” here?
> > One model for charge only, another for discharge only

> P53, “Stateful models can not be validated using traditional means of accurate measurement.”, why?
> > Because I was lazy to implement it from first principal. I still am. We got rid of Statefull models

> P53-4, “able 3.10 for Model №4 takes results from a single cycle only, same as 3.9, since there is no straightforward way to validate across all cycles (marked with ∗ symbol) “, why? Is this is due to the model being stateful, using a custom training loop where you manually reset the state when appropriate and handling data shuffling yourself can easily fix this issue.
> > Stateful Model 4 was removed completely. It is easier to ignore it, rather waise more time implementing.

> P54, “Model №2 had better results in avoiding overfitting since it used two optimisers for quick adjustment and tuning.”, was this observed consistently, or was this just a lucky training run? Model No 2 also has a different architecture, so is the improvement the result of the optimiser or the network?

> P54, “With the number of samples, which the training process went through and based on the RMSE plot, there was a little need for repeated training over the same data repeatedly, as proven in the first several Models“, unclear

> P54, “ Comparison of the validation data act as a determined prove“, unclear

> P54, “3.3.2 Hardware performcene overview” -> “3.3.2 Hardware performance overview”
> > Removed completely

> P56, Table 3.10, Why is No 4, when trained on US06 and FUDS only getting discharge data? This isn’t the case for any other experiment, so why is this the case here?
> > not any more

> P55-56, Table 3.9 and 3.10 are hard to read. Consider using colours, bold font, underlines or similar to highlight the best result (or best few is using colour)
> > It was made from Mamo's published example. Since it is indeed harder to read, table will be redrawen.

> P57-62, Figure 3.6-3.11 are hard to compare. Consider grouping by experiment as all models are run on the
same train/test configurations, or omit the RMS error from the plot and just show all systems for a given
train/test split on one plot

> P63-68, Figure 3.12-3.17, these plots could be in an appendix
P54, “A small timeout to switch between sample intensive datasets allowed GPUs to cool off between model models.”, extra “model” not needed; what hardware is being used in relation to this?

> P54, “paralysation” -> parallelisation

> P69, “ Since the CPU has the lowest compute rating, it attempted only a single dataset, while 2 GPUs handled between 6-8 sets together“, unclear. Are there time constraints here that prevent the CPU from running multiple tests? This is, as I understand it, an offline system. Why limit it like this? Also, what’s being evaluated here?


> P69, Figure 3.18 is very unclear, I do not know what it is showing or why.

> P69, “By itself, Stateful models are not supported by TFLite. Thus, a single attempt to make a Custom Stateful stateless model test is time inefficient, and those seemed unreasonable. “, why were these models considered in the first place then?

> P69, “Calculation of accuracies performed with 20 attempts average and offset calculation with mean of the difference between maximum and minimum. “, why use 20 attempts here and not earlier? Also, is what’s shown in Table 3.11 runtime or accuracy? The text says accuracy, the table shows runtimes?