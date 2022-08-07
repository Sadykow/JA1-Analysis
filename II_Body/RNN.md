## Model implementation
# Intro paragraph
1) Introduction to the section
> P40, eq 3.2, what is alpha set to?
> > No more unkmown equations from no references. We experimentaly determined our way of getting params

2) Parameters definition layers and neurons selection
> P40, “The output layer does not use the same logic, and no activation gets applied.“, would it not make sense to use a sigmoid such the output is in the range [0..1], i.e. from empty to full? Alternatively a clipped relu could be used. Having not activation means that output is unbounded and can be negative, or greater than 100%.
> > My bad. It is a sigmoid function. I tried relu in the past, it rought no useful outcomes.

> P41, “The GRU implementation will be used as a stateful technique by preserving a state from batch to batch with a single sample at a time. The LSTM will take a stateless approach, providing a fixed number of timestamps at a time. “, why? LSTMs support stateful operation as well, the reasoning for this decision is unclear.
> > Replaced with simple mentioning that statefull and non-gradient calculus is removed - "The stateless implementations and non-gradient calculus-based optimisation algorithms will not be used as part of the research as their effectiveness has not been proven during preliminary work for this case."

3) Tanh and sigmoid definitions, equations and dropout.

4) Intro to vanishing gradient problem and gentle move to LSTM and GRU.

5) Introduction statement to Gated Recurrent Unit and Long-Short Term Memory.

### Gradient Recurrent Unit
1) Definition of the GRU

> P41-44, it’s unclear why the detailed outline of the GRU, LSTM and attention is presented here and not in Ch2. Are figures 3.3, 3.4 and 3.5 drawn by the author, or have these been taken from elsewhere? If taken from elsewhere, a citation should be provided
> > We have decided to preserve it here, especially for publication purposes. However, if another feedback will claim the same, with Latex we can quickly move that section at the end of Litrature Review about types of RNNs.

### Long-Short Term Memory
1) Definition of the LSTM

> P42, “For a longer existence, it became the most widely used type of RNN, used in those types of applications.“, in what type of applications? Time series modelling? What is meant by ‘“for a longer existence”?
> > LSTM is 10 years old. "For its' ten years of existence, it became the most widely used type of RNN in those applications."

### Attention Layer
1) Introduction and origins of attention usage
> > The only section I literaly need someone to check on and no comments from exameners, except putting references on the plots I draw from equations. Do I really need to put a note: "Derived by hand from equations"

2) The origins of the source code

## Optimisers
1) Intro statement to optimisers
> P44, why do we need 3.2.4 and 3.2.5? Can’t these sections be combined? Discussion of optimisers could also be in Chapter 2.
> > Let another examener to decide that.

> P44, “The selection of the optimiser defines how fast the model will achieve the local minimum.”, not really. It defines how gradient descent will be performed. A different optimiser does not guarantee faster (or better) convergence. Some such as Adam tend to work better on average, but there is no “best choice” at present. See https://arxiv.org/abs/2007.01547
> > Removed that sentence and rephrases the first one to give a more accurate explanation. Also added sentences 4-5 to explain the reasoning. We could use that link as a reference to evaluation, but we did not perform same thing, as we did with Layers and Neurons at Methodology part.

### Stochastic Gradient
1) Explanation
> P45, “Unlike improved versions, this algorithm has the potential of missing optimum value.”, all optimisers are sensitive to local minima
> > Replaced with "It increases the performance of the algorithm by improving convergence speed in comparison to the classical version." We can add a reference and discussion why it happens, but it's a good reading and does not require elaboration here since Classical SGD here only for equation follow up.

2) Noising the data. *It can be removed since it does not carry any valuable information*. Ended up removing those two sentences.

### Adan and Robus Online Adam
1) Explanation

2) Extension with Robust Online
> P46, “Robust Online version of Adam, Line 10. “, line 10 of what? While the hyperlink directs to Algorithm 3, the text should make this clearer
> > I am impressed he noticed that I misreferenced it. I truly misjudged him.

3) Important note of the implementaion RoAdam, which I suffered from.
> > I have the following statement in the end of the paragraph, but I find it out of context at the current explanation since in mentions the frameworks. "Optimiser implementation from the first principle remains the most viable option for the current version of TensorFlow, there as PyTorch already has the variation inbuilt to the standard library."


### Ensemble optimisation with Nadam and AdaMax
1) Explanation and advantage over Adam
> P48, “The first is the training converges, which may not happen at all [45]. The second is the chance of missing the optimal solution [46]“, any optimiser can suffer from this
> > "The first is if the training converges, which may not happen at all.
The second is if the optimal solution gets frequently missed at large learning steps.
" - The point is that one optimiser does not work, try another. We saw such behavior then model gets overfitted, and then jump into another minimum, which it tries to get to, and then takes forever getting in.
****
2) Nadam advantage over Adam
> > From my notes: {Another error. This time with SQRT. According to Adam and the source code in TF for Nadam, epsilon is not inside sqrt(). Although the original article stands otherwise, Xiao noticed that too and corrected it. I am sticking with whatever I have at TF. There is not $\beta_i$ and not $\beta_2$ in second moment update equation. All of that was corrected.}.

3) AdaMax advantages over Adam

4) Ensemble implementation