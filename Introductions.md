## Feedback
1. This chapter presents a benchmarking study considering existing methods from the literature, and evaluating them in a (somewhat) consistent manner.
While I feel that this is needed, the evaluation is poorly executed and results are hard to follow.

1. The chapter focuses too much on optimisers and seems to regard them as the main source of variation.
Detailed overviews of each optimiser are presented, while the underlying architectures (withstanding the discussion of LSTM and GRU cells) are given very briefly and are unclear. For example, the actual networks evaluated (how many layers, size of each layer, activations, etc) are not stated clearly.
Network diagrams that clearly show each of the 6 considered architectures need to be included.
Diagrams should contain sufficient information to allow re-implementation.

1. The manner in which models are trained is also confusing, in particular, why not train on two datasets and test on the third; or train on one, use a second for validation, and the third as the test set?
Either of these would more accurately reflect a standard cross-fold validation approach, give the methods the same or more data to train on to aid generalisation, yet still have a totally unseen test set.
The rationale for the chosen approach is unclear.

1. The results themselves are hard to follow as experimental results are not aggregated in any way.
For each of the six models, there are 6 evaluations on unseen test sets.
While having the full results is great, the lack of any summary of the results in Tables 3.9 and 3.10 makes understanding overall performance very hard.
A simple summary of the results obtained by averaging results across the 6 evaluations on unseen test sets for each of the 6 systems would help highlight which model is performing best.

1. With respect to the evaluations, it is also unclear what changes in results are caused by the network changes (i.e. GRU vs LSTM), what changes result from changing the optimizer, and what variations are simply noise in the results caused by the natural variation seen when training neural networks. The thesis does seem to acknowledge this at one point (p53, “The advantage of one over another is a simple matter of randomness in the initial training results. The attention layer may not significantly boost the training or accuracy, but it gave a good foundation for further improvements and modifications.“), but does nothing about this variation.
It is strongly recommended that evaluations be restructured to separate variations in the optimisers and the network design, and to account for random variation. This would mean:
- Run all 6 networks with same optimiser (perhaps Adam with default settings), run each experiment ~10 times, and report the mean and std.dev results
- For selected networks (best 1 or 2), run the networks with different optimisers and/or different optimiser parameters. Again run each experiment ~10 times and report mean and std.dev results
For further details on variation between optimiers, refer to https://arxiv.org/abs/2007.01547.

1. The rationale for including stateful models in the evaluation is unclear. 
Theoretically, their inclusion makes sense, however there seems to be severe limitations with their evaluation (though it’s not clear why - there’s nothing that should prevent them working), and they are not supported by TFLite and so cannot be used in any of the experiments on embedded devices anyway.
Given the TFLite limitation, it’s unclear why they are included in the earlier evaluations.

1. The evaluations of run-time are poorly presented and are unclear.
What is evaluated in this section, and how, needs to be better explained.

1. Finally, in the conclusion other time series models are mentioned (p70, ”Even though most models provided excellent results, they lacked the accuracy of time-series models, observed in similar scenarios.“).
It is unclear what models these are, as the thesis has focussed almost exclusively on neural network models up to this point.
If other methods are better performing or more appropriate, they should be considered within this study.


2. This is the most substantial chapter in the thesis. It compares several existing recurrent neural networks (specifically, several LSTMs and GRUs) for predicting SoC.
While a comparative study could be valuable, the study in this chapter has multiple problems.

2. First, when using existing neural networks, the study makes no effort in tuning the hyper-parameters (e.g., the number of layers used, the number of neurons in each layer, the learning rates).
In general, hyper-parameter is considered essential when we try to build a neural net (such as an LSTM) on a given dataset, unless there is a good reason for not
doing this.

2. Second, some models have not been sufficiently trained. For example, Fig. 3.14 shows divergent training and test losses.
In a correct setup, a model should be trained until the loss converges.

2. Third, the training procedure of the neural networks appears to be inconsistent. 
The learning curves in Fig. 3.12-17 show that different numbers of epochs are used to train different models.
Since divergent losses are observed in some cases, this is not a result of
early stopping.

2. Besides the above issues, the description of the methods does not provide (or does not clearly describe) necessary details required for reproducibility.
For example, a description of the training procedure for a neural network should include the batch size, the number of training epochs, but as far as I can see, these are not mentioned anywhere.
The training loss need to be clearly specified, but it is at least not clearly described, if not missing.

2. A discussion of the results in comparison with results in similar studies is needed too.
For example, Yang et al. [2020] also considers predicting the SoC for cylindrical 18650 lithium iron phosphate batteries from A123 Systems, LLC.
Discussion with respect to their extensive study of the performance of various machine learning algorithms will strengthen the work.
In particular, their LSTM results are much better than those reported in this thesis, and this need to be discussed.

2. Overall, the work reflects a lack of skills to properly apply deep learning techniques, and there is limited value in the current study.
The experiments need to be redesigned to address the above issues, so that it can provide useful conclusions such as LSTM+Attention is better than vanilla LSTM.


### Introduction (article)
1. Importance of Electric Vehicles and their battery problem.

2. The state of Charge, methods and its' value on BMS.

3. Comparison between traditional methods and ML-based estimations.

4. What has been done in the area of RNN for battery characterisation
   1. We going to use RNN to explode those methods.

6. Results from other authors and how good reports are
   1. GRU and LSTM and who used it.

7. Types of data they all deal with. DST, US ...
   1. SHow how data was used by other. SOme did discharge, others mixed and why we need to use like full charge and regenerative charge. Follow idea, arefer to athors.

8. Purpose of this paper and how will it go.
### Introduction (thesis)
1. Introduce a chapter describing LSTM and GRU, publications to review and accurate comparison.

2. History of using some of those types of models
> (1) "Later, some approaches introduced additional...." what parameters where intrioduced?
>> modifying models' structure, optimising fitting process and enhancing data pipelines

> (1) "RNN effectiveness in time-series..." is not a great reference to support RNNs here. A paper from a
reputable machine learning/neural networks venue (NIPS, ICML, etc) would be more appropriate.
> > 

3. What is terrible about RNN models, and what did other authors improve them?
> (1) "Besides good convergence...." - what convergense is refered here?
> > within 2-5\% to the actual data

> (1) “That can be achieved with stateful models..." Bad wording - stateful models preserve the internal representation stored within the LSTM
> > which preserve and update the state within LSTM cells themself with every passing prediction, making the impact of the history affect results continuously.

4. Validation procedure problem and lack of data of the same condition
> (1) "Both stateful and stateless methods fall... ", unclear, what is
meant by “fall” here?
> > Both stateful and stateless methods rely on input samples' quality and length.

> (1) "It was concluded that the ... “, at what sampling rate? The number of samples is important
> > 1 second was always in use, so add it here too

> (1) “In addition, the normalisation...“,
what sort of normalisation? Min-max normalisation, or standardisation?
> > No point mention our normalisation here, list some of those which were used in other or we attampted

5. Online validation attempt and what good about it

> (1) “Even though the estimation produces accurate output with tabled data...”, what is “tabled data”? Is this data captured in a lab environment with the battery unit removed from the car?
> > "Tabled data we called whatever generated or gathered data from anything". tabled data from precisive battery cycling machines

> (1) “Several attempts to introduce an online ... “,
This is unclear. What has been integrated into the training process? What is written implies some form of continuous learning whereby newly acquired data is continually included in the training set to improve performance, but I suspect that this is not what is meant.
> > "I got rid of this part. No point of this being here anyway"

> (2) “The statefulness defines the input method... .”: This defines the concept of “statefulness” used many times later, but the sentence is awkward and confusing. If I understand correctly, this refers to the “stateful” argument in Kera’s LSTM implementation (https://keras.io/api/layers/ recurrent_layers/lstm/). In that case, the definition is plainly wrong, and need to be fixed according to the documentation provided at the given link.

6. Tabled summary from reviewed articles
   
7. What has been done so far by other authors, and what are they using to achieve that?
> (2) “All authors ...”: Who are “al0.l authors”? This sentence seems to be out of place.
> > Make reference to litrature review here, or to the table in the same place

8. How the performance testing is performed and what challenges it brings.
> (1) “Even with other SoC estimation technique usage, the computational complexity of training any NN is complicated to fit on a low power device. “, is this the case for a self-driving car though? The sensor technologies used in self-driving cars and the DCNN based methods used to operate over them require GPU resources on board (i.e. in the vehicle).
> > Why everyone goes to expensive solutions?! Do I realy need to specify it all the time?! GPU is not a low-power devices! I guess I would put a small note mentioning "NOT FOR GPU USAGE"
> > "... the computational complexity of training any NN is loaded to be performed on an accumulator's battery management system. "

9. The goal of this chapter. It will investigate, implement and compare..
NOTE: Probably also introduce the methodology, which will be used through the research.
> (1) “This chapter investigates, implements and compares extended memory-based models...“, be careful with “extended memory” and similar terms, there is a large field of research into neural memory networks which are explicit memory blocks that are learned and updated by a NN. These are very separate to simple LSTM and GRU models
> > I guess I should use "modified" or "costomised" in this regard. Word was removed.

> (1) “Gradient Recurrent Unit“ should be “Gated Recurrent Unit”
> > Run the search through entire document, I make that mistake very commonly.

> (1) “However, there is no valid proof of if GRU or LSTM is helpful for battery SoC estimation. “, what about the methods listed in Table 3.1? Why don’t they validate the utility of GRUs and LSTMs for this task? I accept
that there may be flaws with their methods, but this statement seems to totally disregarding their work as though it is invalid or doesn’t exist
> > My bad, it was corrected in the article, but not in thesis. THis means whetver GRU or LSTM better betnween each other for SoC. My poor wording. Noone comapres them between each other.