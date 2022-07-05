### Introduction (article)
1) Importance of the Electric Vehicles and their battery problem.
2) State of Charge, methods and its' value on BMS.
3) Comparison between regular methods and ML based estimations.
4) What has been done in the area of RNN for battery charecterisation
5) Results from other authors and how good reports are
6) Types of data they all dealing with. DST, US ...
7) Purpose of this paper and how will it go.
### Introduction (thesis)
1) Introduce chapter describing LSTM and GRU, publications to review and accuracy comparison.
> (1) "RNN effectiveness in time-series..." is not a great reference to support RNNs here. A paper from a
reputable machine learning/neural networks venue (NIPS, ICML, etc) would be more appropriate.
> > 
2) History of usage some of those types of models
> (1) "Later, some approaches introduced additional...." what parameters where intrioduced?

> (1) "Besides good convergence...." - what convergense is refered here?
> > Besides good convergence in general time series usage <br>

> (1) “That can be achieved with stateful models..." Bad wording - stateful models preserve the internal representation stored within the LSTM

3) What bad about RNN models, and what others authors did to improve them?
> (1) "Both stateful and stateless methods fall... ", unclear, what is
meant by “fall” here?

> (1) "It was concluded that the ... “, at what sampling rate? The number of samples is important
> > 1 second was always in use, so add it here too

> (1) “In addition, the normalisation...“,
what sort of normalisation? Min-max normalisation, or standardisation?
> > No point mention our normalisation here, list some of those which were used in other or we attampted

4) Validation procedure problem and lack of data of same condition
> (1) “Even though the estimation produces accurate output with tabled data...”, what is “tabled data”? Is this data captured in a lab environment with the battery unit removed from the car?
> > Tabled data we called whatever generated or gathered data from anything, not real time comming. We need to be clearer here

5) Online validation attempt and what good about it
> (1) “Several attempts to introduce an online ... “,
This is unclear. What has been integrated into the training process? What is written implies some form of continuous learning whereby newly acquired data is continually included in the training set to improve performance, but I suspect that this is not what is meant.

> (2) “The statefulness defines the input method... .”: This defines the concept of “statefulness” used many times later, but the sentence is awkward and confusing. If I understand correctly, this refers to the “stateful” argument in Kera’s LSTM implementation (https://keras.io/api/layers/ recurrent_layers/lstm/). In that case, the definition is plainly wrong, and need to be fixed according to the documentation provided at the given link.

6) What has been done so far by other authors and what are they using to achieve that?
> (2) “All authors ...”: Who are “all authors”? This sentence seems to be out of place.
> > Make reference to litrature review here, or to the table in the same place

7) How the performance testing is performed and what challenges it brings.
> (1) “Even with other SoC estimation technique usage, the computational complexity of training any NN is complicated to fit on a low power device. “, is this the case for a self-driving car though? The sensor technologies used in self-driving cars and the DCNN based methods used to operate over them require GPU resources on board (i.e. in the vehicle).
> > Why everyone goes to expensive solutions?! Do I realy need to specify it all the time?! GPU is not a low-power devices! I guess I would put a small note mentioning "NOT FOR GPU USAGE"

8) The goal of this chapter. It will investigate, implement and compare..
NOTE: Probably also introduce the methodology, which will be used though the research.
> (1) “This chapter investigates, implements and compares extended memory-based models...“, be careful with “extended memory” and similar terms, there is a large field of research into neural memory networks which are explicit memory blocks that are learned and updated by a NN. These are very separate to simple LSTM and GRU models
> > I guess I should use "modified" or "costomised" in this regard.

> (1) “Gradient Recurrent Unit“ should be “Gated Recurrent Unit”
> > Run the search through entire document, I make that mistake very commonly.

> (1) “However, there is no valid proof of if GRU or LSTM is helpful for battery SoC estimation. “, what about the methods listed in Table 3.1? Why don’t they validate the utility of GRUs and LSTMs for this task? I accept
that there may be flaws with their methods, but this statement seems to totally disregarding their work as though it is invalid or doesn’t exist
> > My bad, it was corrected in the article, but not in thesis. THis means whetver GRU or LSTM better betnween each other for SoC. My poor wording. Noone comapres them between each other.