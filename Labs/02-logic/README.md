# Lab 2: Combinational logic
## Preparation tasks (done before the lab at home)

*Digital* or *Binary comparator* compares the digital signals A, B presented at input terminal and produce outputs depending upon the condition of those inputs. Complete the truth table for 2-bit *Identity comparator* (B equals A), and two *Magnitude comparators* (B is greater than A, B is less than A). Note that, such a digital device has four inputs and three outputs/functions.

| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** | 
| :-: | :-: | :-: | :-: | :-: | :-: | 
| 0 | 0 0 | 0 0 | 0 | 1 | 0 |  
| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
| 4 | 0 1 | 0 0 | 1 | 0 | 0 |
| 5 | 0 1 | 0 1 | 0 | 1 | 0 |
| 6 | 0 1 | 1 0 | 0 | 0 | 1 |
| 7 | 0 1 | 1 1 | 0 | 0 | 1 |
| 8 | 1 0 | 0 0 | 1 | 0 | 0 |
| 9 | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |
 
**eq_sop** = (¬b1 * ¬b0 * ¬a1 * ¬a0) + (b1 * ¬b0 * a1 * ¬a0) + (¬b1 * b0 * ¬a1 * ¬a0) + (b1 * b0 * a1 * a0) ;
 
**bla_pos** = (b1 + b0 + a1 + a0) * (b1 + ¬b0 + a1 + a0) * (b1 + ¬b0 + a1 + ¬a0) * (¬b1 + b0 + a1 + a0) * (¬b1 + b0 + a1 + ¬a0) * 
            (¬b1 + b0 + ¬a1 + a0) * (¬b1 + ¬b0 + a1 + a0) * (¬b1 + ¬b0 + a1 + ¬a0) * (¬b1 + ¬b0 + ¬a1 + a0) * (¬b1 + ¬b0 + ¬a1 + ¬a0);

**bgta_pos** = (b1 + b0 + a1 + a0) * (b1 + b0 + a1 + ¬a0) * (b1 + b0 + ¬a1 + a0) * (b1 + b0 + ¬a1 + ¬a0) * (b1 + ¬b0 + a1 + ¬a0) * 
            (b1 + ¬b0 + ¬a1 + a0) * (b1 + ¬b0 + ¬a1 + ¬a0) * (¬b1 + b0 + ¬a1 + a0) * (¬b1 + b0 + ¬a1 + ¬a0) * (¬b1 + ¬b0 + ¬a1 + ¬a0);
## K-maps

Use K-maps to create a simplified SoP form of the "greater than" function and a PoS form of the "less than" function.
### Karnaugh map for "greater" function
<img src="IMAGES/AmensinezB.png" width="500">

### Karnaugh map for "equals" function
<img src="IMAGES/ArovnoB.png" width="480">

### Karnaugh map for "less" function
<img src="IMAGES/AvetsinezB.png" width="480">


