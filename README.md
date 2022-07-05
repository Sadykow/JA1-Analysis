# Journal Article
This is general information of the article, necessary for deployment and compilatiom/

## Structure content
Overview of each paragraph section by section with a brief description of each content and comments from examenors.
> 1-2) BlockQuote is used to indicate exameners comment. Number refers to one of them
> > This is my respone or soulution I provided
> > > 3rd or every odd line will be refered by supervisor.
```
Marking of the psudocode or reference to whatever implementation it is refeered
```
## Feedback from Examiner 1
This chapter presents a benchmarking study considering existing methods from the literature, and evaluating them in a (somewhat) consistent manner. While I feel that this is needed, the evaluation is poorly executed and
results are hard to follow.
> > This is already big, making even more bigger makes follow up even harder.


The chapter focuses too much on optimisers and seems to regard them as the main source of variation. Detailed overviews of each optimiser are presented, while the underlying architectures (withstanding the discussion of LSTM and GRU cells) are given very briefly and are unclear. For example, the actual networks evaluated (how many layers, size of each layer, activations, etc) are not stated clearly. Network diagrams that clearly show each of the 6 considered architectures need to be included. Diagrams should contain sufficient information to allow re-implementation.
> > We are giving information on number of layers, but htat has nothing to do with making LSTM and GRU content bigger.


The manner in which models are trained is also confusing, in particular, why not train on two datasets and test on the third; or train on one, use a second for validation, and the third as the test set? Either of these would more accurately reflect a standard cross-fold validation approach, give the methods the same or more data to train on to aid generalisation, yet still have a totally unseen test set. The rationale for the chosen approach is unclear.
> > I need to state clearly where and how it will be used. The first trained selection of the model is important in order not to screw up future online enhancement process.



The results themselves are hard to follow as experimental results are not aggregated in any way. For each of
the six models, there are 6 evaluations on unseen test sets. While having the full results is great, the lack of
any summary of the results in Tables 3.9 and 3.10 makes understanding overall performance very hard. A
simple summary of the results obtained by averaging results across the 6 evaluations on unseen test sets for
each of the 6 systems would help highlight which model is performing best.
> > Need to think once we have results. Why can't we have appendix?

With respect to the evaluations, it is also unclear what changes in results are caused by the network changes (i.e. GRU vs LSTM), what changes result from changing the optimizer, and what variations are simply noise in the results caused by the natural variation seen when training neural networks. The thesis does seem to acknowledge this at one point (p53, “The advantage of one over another is a simple matter of randomness in the initial training results. The attention layer may not significantly boost the training or accuracy, but it gave a good foundation for further improvements and modifications.“), but does nothing about this variation. It is strongly recommended that evaluations be restructured to separate variations in the optimisers and the network design, and to account for random variation. This would mean:
- Run all 6 networks with same optimiser (perhaps Adam with default settings), run each experiment ~10 times, and report the mean and std.dev results
- For selected networks (best 1 or 2), run the networks with different optimisers and/or different optimiser parameters. Again run each experiment ~10 times and report mean and std.dev results
For further details on variation between optimiers, refer to https://arxiv.org/abs/2007.01547.
> > It is done now


The rationale for including stateful models in the evaluation is unclear. Theoretically, their inclusion makes sense, however there seems to be severe limitations with their evaluation (though it’s not clear why - there’s nothing that should prevent them working), and they are not supported by TFLite and so cannot be used in any of the experiments on embedded devices anyway. Given the TFLite limitation, it’s unclear why they are included in the earlier evaluations.
> > TFlites hasve become better, but I am going to save myself time and get rid of them completely, just like we did with Mamos optimiser: "Not part of the research"


The evaluations of run-time are poorly presented and are unclear. What is evaluated in this section, and how,
needs to be better explained.
> > It is not here. Well, it is now.

Finally, in the conclusion other time series models are mentioned (p70, ”Even though most models provided excellent results, they lacked the accuracy of time-series models, observed in similar scenarios.“). It is unclear what models these are, as the thesis has focussed almost exclusively on neural network models up to this point. If other methods are better performing or more appropriate, they should be considered within this study.

## Feedback from Examiner 2
This is the most substantial chapter in the thesis. It compares several existing recurrent neural networks (specifically, several LSTMs and GRUs) for predicting SoC. While a comparative study could be valuable, the study in this chapter has multiple problems.


First, when using existing neural networks, the study makes no effort in tuning the hyper-parameters (e.g., the number of layers used, the number of neurons in each layer, the learning rates). In general, hyper-parameter is considered essential when we try to build a neural net (such as an LSTM) on a given dataset, unless there is a good reason for not
doing this.
> > Too much effor to tune all of them, but learning rate is tuned now and layers get set from initial point

Second, some models have not been sufficiently trained. For example, Fig. 3.14 shows divergent training and test losses. In a correct setup, a model should be trained until the loss converges.
> > Model will train until they converege now. If someone start rising te error, it will be interupted.

Third, the training procedure of the neural networks appears to be inconsistent. The learning curves in Fig. 3.12-17 show that different numbers of epochs are used to train different models. Since divergent losses are observed in some cases, this is not a result of early stopping.
> > No callbacks anymore. I implemented those things from first principel myself manually.

Besides the above issues, the description of the methods does not provide (or does not clearly describe) necessary details required for reproducibility. For example, a description of the training procedure for a neural network should include the batch size, the number of training epochs, but as far as I can see, these are not mentioned anywhere. The training loss need to be clearly specified, but it is at least not clearly described, if not missing.
> > It is there. It is the smae for all and in the table.

A discussion of the results in comparison with results in similar studies is needed too. For example, Yang et al. [2020] also considers predicting the SoC for cylindrical 18650 lithium iron phosphate batteries from A123 Systems, LLC. Discussion with respect to their extensive study of the performance of various machine learning algorithms will strengthen the work. In particular, their LSTM results are much better than those reported in this thesis, and this need to be discussed.
> > I'll be cursed, he literally asks me to object someone work. This will mean to expose their methods of using only charge, where we using entire cycle in the interpolated form. I must be careful here, where would that even fit?


Overall, the work reflects a lack of skills to properly apply deep learning techniques, and there is limited value in the current study. The experiments need to be redesigned to address the above issues, so that it can provide useful conclusions such as LSTM+Attention is better than vanilla LSTM.
> > That is Masters Thesis, not PhD work 4 years long. Do they really expect me to go through all the details? I researched only something relevant and something quickly too apply practile or did I miss something when I applied 2 years ago? Considerign that we were doing only for one year, then the other was spent for evaluation and building a new one, we have done great.

# Markdown Examples for future use
I just love **bold text**.

I just love __bold text__.
This text is **_really important_**.

I love supporting the **[EFF](https://eff.org)**.

This is the *[Markdown Guide](https://www.markdownguide.org)*.

See the section on [`code`](#code).