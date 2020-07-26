# nasa_bplib

## BP Lib
[BPLib](https://github.com/nasa/bplib) is an open-source NASA project that implements the [Bundle Protocol](https://tools.ietf.org/html/rfc5050)
version 6 specification for creating delay tolerant networks. As part of my summer internship with NASA in 2019 I contributed to this library
by creating two libraries which improved the security and overall perform of BPLib.

* Red Black Range Tree
* Cyclical Redundancy Check

## Red Black Range Tree
The Red Black Range Tree library was a variant of a standard [Red Black Tree](https://en.wikipedia.org/wiki/Red%E2%80%93black_tree) designed
to be able to store ranges of values efficiently instead of single values. This resulted in some interesting changes to the standard Red Black
Tree datastructure in that each node of the Tree represented a range of values. Therefore, insertion and removal operations from the tree had to
take into account merging or splitting consecutive ranges of values.

For example if the values, 4, 5, 6 and 8, 9, 10 were inserted into the tree, a standard red black tree would have created a node for each of these 
values. Instead this range tree created two nodes representing the ranges 4-6 and 8-10. If 7 were then inserted into the tree, it would need to merge
these two nodes to a single range node containing the values 4-10.

This range variant of the red black tree was extremely space efficient and implemented such that malloc would only need to be called a single time
upon instantiating the tree to reserve all possible memory the tree would use. Later calls to add or remove nodes would then be handled by maintaining
a list of free memory blocks within the tree and allocating / deallocating them appropirately. THe reason for this design decision was that all space flight
software neeeds to request its memory upfront to avoid any issues in flight freeing or allocing memory. Furthermore, due to limited compute resources the
tree was implemented to use no recursive functions to avoid pushing too many function call onto the stack.

Within BPLib the tree was used to keep track of the bundle IDs of various bundles that were received by a node in the network. Since bundles were not garunteed to arrive in any particular order, the tree could easily recieve new bundles and ideally merge itself down to a single node if all bundles were eventually received.
On some recurring interval the tree would get cleared and write its ranges in an acknowledgement message to a sender node within the delay tolerant network to confirm which bundles were recieved and which may need to be retransmitted.

## Cyclical Redundancy Check
The cyclical redudancy check libarary implemented here was designed for confirming the integrity of data transmitted through the bundle protocol. While this is a fairly standard library implementation, some extra thought and effort went into designing the modulous lookup table design and the architecture of the crc structures to be lightweight and extremely fast.
