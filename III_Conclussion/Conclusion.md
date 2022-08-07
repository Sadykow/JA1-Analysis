> P70, Table 3.11, is this showing run-time per sample? Or for the whole dataset? It’s also unclear if the same thing is being run on each system. Figure 3.18 suggests that different datasets/experiments are run on different systems, but it’s unclear if that relates to this table or not.

> P70, ”Even though most models provided excellent results, they lacked the accuracy of time-series models, observed in similar scenarios.“, what time series models? If NNs are not as accurate, why aren’t these other models (which have not been discussed at all in the thesis to this point) being considered?

> p70, “By closely examining average weights between three input features and general observation, models tend to rely more on the voltages than currents.“, where is this analysis? How was it conducted? Was it just inspection of model weights, or an interpretation method such as Shapley values?

> P70, “Therefore, the poor prediction was observed in the shallow middle area of the charge due to this lack of weights placed on current,“, unclear what the “shallow middle area” is

> P70, “It is observed in the comparison plots of different driving profiles.“, yet not discussed at the time. These details should be highlighted when discussing these plots rather than waiting until the chapter conclusion

> P70, “The models tend to put equal or lower weight on the temperature feature. “, evidence to support this?

> P70, “much more severely increase or decrease slope over utilisation.”, unclear

> P70, “The better the fit over a single training profile, the more offset it becomes against the other two. “, so why not train on two and test on one?

> P71, “However, due to the Coulumbinc efficiency of Li-ion cells, CC methods suffer from many factors that make reading equally inaccurate in the long run.“ given the discussion of CC methods here, it would have been good to have a CC baseline to compare to the DL methods

> P71, “for using ML algorithms embeddedly” -> “or using ML algorithms on embedded devices”