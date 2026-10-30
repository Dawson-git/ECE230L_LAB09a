# Sequential Circuits: Latches

In this lab, you learned about the basic building block of sequential circuits: the latch.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names Dawson Gardels, Nicholas Ordway

## Summary

## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
	We cannot just use structural Verilog to impliment latches because it will not update its latches when values change.

### What is the meaning of always @(*) in a sensitivity block?

	The always block mens to reevalute the code inside when any value in the @() changes but putting * in the block mean any value change in the module.
### What importance is memory to digital circuits?
	Without memory in a digital circuit we could not store any of the data in a usefull format. 
	If you wanted to use a demux and mux to give many an addition circuit's output into a multiplication circuits input it could not be done.
