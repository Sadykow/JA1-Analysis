# Practical Evaluation of Lithium-Ion Battery State-of-Charge Estimation Using Time-Series Machine Learning for Electric Vehicles
The Latex based source code the first Journal article published in Energies at Section "F5: Artificial Intelligence and Smart Energy" of Special Issue **Computational Intelligence in Electrical Systems**.

Code compatible with Overleaf and gets built with `pdflatex`.
Majority of the figures were generated from work Python code in SVG format using `matplotlib` library.
All edits, structure sorting and Feedback from examinors have been preserved in corresponding Markdown files.

## Citation and PDF
The full citation and output PDF can be found on the publication page with the following citation:

Sadykov, M.; Haines, S.; Broadmeadow, M.; Walker, G.; Holmes, D.W. Practical Evaluation of Lithium-Ion Battery State-of-Charge Estimation Using Time-Series Machine Learning for Electric Vehicles. *Energies* **2023**, *16*, 1628. [https://doi.org/10.3390/en16041628](https://doi.org/10.3390/en16041628 "Aricle Location")

## List of Authors:
[Marat Sadykov (First Author)](https://orcid.org/0000-0002-6436-7069)

[Dr Mark Broadmeadow](https://orcid.org/0000-0001-7041-5904)

[Pr Geoff Walker](https://orcid.org/0000-0001-8137-9507)

[Pr David Holmes (Corresponding Author)](https://orcid.org/0000-0002-2970-9158)

## Additional tools:
* [most_common_words.bash](most_common_words.bash) is used as a tool to identify keywords of the article.
* The diagram of the Cells were created using Googles [draw.io](draw.io).

## Abstact:
This paper presents a practical usability investigation of recurrent neural networks (RNNs) to determine the best-suited machine learning method for estimating electric vehicle (EV) batteries’ state of charge. Using models from multiple published sources and cross-validation testing with several driving scenarios to determine the state of charge of lithium-ion batteries, we assessed their accuracy and drawbacks. Five models were selected from various published state-of-charge estimation models, based on cell types with GRU or LSTM, and optimisers such as stochastic gradient descent, Adam, Nadam, AdaMax, and Robust Adam, with extensions via momentum calculus or an attention layer. Each method was examined by applying training techniques such as a learning rate scheduler or rollback recovery to speed up the fitting, highlighting the implementation specifics. All this was carried out using the TensorFlow framework, and the implementation was performed as closely to the published sources as possible on openly available battery data. The results highlighted an average percentage accuracy of 96.56% for the correct SoC estimation and several drawbacks of the overall implementation, and we propose potential solutions for further improvement. Every implemented model had a similar drawback, which was the poor capturing of the middle area of charge, applying a higher weight to the voltage than the current. The combination of these techniques into a single custom model could result in a better-suited model, further improving the accuracy.
### Keywords:
driving schedulers; gradient recurrent unit (GRU); optimisers; lithium-ion battery (Li-ion); long short-term memory (LSTM); recurrent neural networks (RNNs); state-of-charge (SoC) estimation; time-series machine learning