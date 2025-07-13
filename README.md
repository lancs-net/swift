# SWIFT: Semantic Web Intent Framework for intent Translation 


## Getting Started

Prerequisites:
- [SWI-Prolog](https://www.swi-prolog.org/) installed on your system.

### Using the justfile

```
just swipl
```

This will bring you into a SWI-Prolog REPL, loading the ontology as predicates, rules for intent translation, and network topology with which we can query and deploy network slices.


### No justfile

Run this command to get started

```
swipl -g "consult('./prolog/oz.pro')" -g "consult('./prolog/ont_network.pro')" -g "consult('./prolog/ont_intent.pro')" -g test
```

### Demo case

After running either of the above commands, the SWI-Prolog environment will have loaded the ontology as prolog predicates, along with the rules for intent translation and network topology. 

```
?- demo.
```
This will run a demo case which adds a new slice on each gNodeB in the network topology, serviced by a brand new UPF and SMF deployment, allocating bandwidth across the network to ensure no links are overburdened.


## Citation

```bibtex
@software{alcock2025swift,
  author = {Alcock, Paul and Anand, Revika, and Rotsos, Charalampos and Race, Nicholas},
  title = {SWIFT: Semantic Web Intent Framework for intent Translation},
  url = {},
  doi = {},
  year = {2025}
```
