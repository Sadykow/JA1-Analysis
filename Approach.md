## Machine Learning approach evaluated
### Into paragraph
1) The focus of the section, overview of models and optimisers. **Figure 5**
> (1) P38, Figure 3.1 is low quality. Also, Figure 3.1 shows a feed forward network, yet the caption and the text refer to it as showing the structure of an RNN
> > It may bot the best exampel of RNN, I agree. But that't definitely not a Feed-Forward Network, not even a nit.
### Model structure
1) Neuron selection
TODO: Tobe replaced from methodology.
> (1) P40, eq 3.2, what is alpha set to?
> > We will get rid of it, but what wrong was with 2(5)-10

2) Activation function with tanh equation
> (1) P40, “The output layer does not use the same logic, and no activation gets applied.“, would it not make sense to use a sigmoid such the output is in the range [0..1], i.e. from empty to full? Alternatively a clipped relu could be used. Having not activation means that output is unbounded and can be negative, or greater than 100%.
> > This has been corrected, but not written. I don't know how we missed that since we already agreed to apply sigmoind on all outputs to make them bound to [0,1]

3) Vanishing gradient problem
TODO: Address exameners notes
> (1) P41, “The GRU implementation will be used as a stateful technique by preserving a state from batch to batch with a single sample at a time. The LSTM will take a stateless approach, providing a fixed number of timestamp
> > Will be removed

4) LSTM and GRU
TODO: Correct with changes of statefulnes.

5) GRU explanatuin with diagram **Figure 6**
TODO: Correct with changes of statefulnes.
> (1) P41-44, it’s unclear why the detailed outline of the GRU, LSTM and attention is presented here and not in Ch2. Are figures 3.3, 3.4 and 3.5 drawn by the author, or have these been taken from elsewhere? If taken from elsewhere, a citation should be provided

6) LSTM explanation with diagrams **Figure 7**
> (1) P42, “For a longer existence, it became the most widely used type of RNN, used in those types of applications.“, in what type of applications? Time series modelling? What is meant by ‘“for a longer existence”?
> > LSTM is the oldest incomparison to GRU, almost 10 year. I should mention the exact date here.

7) Attention Layer implementation.
> > Worth adding that LSTM now introduced by default, but this uses first principle implementation.

### Optimisers
1) Purpose of the optimiser. **Table II**
> (1) P44, why do we need 3.2.4 and 3.2.5? Can’t these sections be combined? Discussion of optimisers could also be in Chapter 2.
> (1) P44, “The selection of the optimiser defines how fast the model will achieve the local minimum.”, not really. It defines how gradient descent will be performed. A different optimiser does not guarantee faster (or better) convergence. Some such as Adam tend to work better on average, but there is no “best choice” at present.
See https://arxiv.org/abs/2007.01547
> (1) P35, table 3.2, As noted in https://arxiv.org/abs/2007.01547, performance variation across optimisers and within different runs for a single optimiser can be quite pronounced. I’d avoid reading too much into differences between optimisers unless you have very rigorous experiments to back the results up.
TODO: Fix in accordences to changes of the Table 2.

2) SGD and with Momentum
> (1) P45, “Unlike improved versions, this algorithm has the potential of missing optimum value.”, all optimisers are sensitive to local minima
> (2) (pp. 45) Alg. 1: clearly define input data, i, L t , W t ; x_n and y_n are not explicitly used later; specify the convergence criterion used in the experiments. These comments generally apply to other pseudo-codes too.

3) Application of the noising, and why it is not used in our case

4) Adam optimiser

5) Extended Adam by Javid **Table IV**
> (1) P46, “Robust Online version of Adam, Line 10. “, line 10 of what? While the hyperlink directs to Algorithm 3, the text should make this clearer
> > I missed the reference to Algorithm or it got broken to specific line link. I wonder where else I could have faultify that.

6) RoAdam on the framework

7) Ensemble from mixing Nadam and AdaMax
> (1) P48, “The first is the training converges, which may not happen at all [45]. The second is the chance of missing the optimal solution [46]“, any optimiser can suffer from this
> > I think I menat overstepping theoptimal, that is why we changing it to a lower rate and different type.

8) Nadam in the Ensemble

9) AdaMax in the Ensemble

10) Purpose of the Pre-tuning and Fine-tuning

11) Hyper params selection
TODO: ToBE merged with another paragrapgh


