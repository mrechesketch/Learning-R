The "v" is modeled after the vector from C++'s STL : http://www.cplusplus.com/reference/vector/vector/ 

It makes a tradeoff of space and speed to provide a vector with (drumroll please) CONSTANT APPEND TIME  

Our v will closely model the C++ vector. Our v is named after R's very own vector constructor c()

Here are the public facing methods..

| Method Name | Return Type | Complexity |
| ----------- | :---------: | ---------: |
| $push_back  |   void      |   O(1)     |
| $pop_back   |   ANY       |   O(1)     |
| $contains   |   boolean   |   O(N)     |
| $size       |   integer   |   O(1)     |


Our v will also be able to intialize, show, use [] to access (and maybe even define?)



