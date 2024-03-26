# EPFL eVoting ops

## Purpose

The goal of this repository is to deploy a minimal eVoting service based on 
the [dvoting][dvoting-repo] system with Ansible. This includes N (N>=4) conodes and a web frontend.
This is an attempt to _ansibilize_ Linus's [scripts][linus-scripts]

## Usage

```bash
# ./votsible
```

## Demo setup
We have a number of VMs that can be used to demo the system. It will not be 
suitable for production as all the nodes are in our hands, but it is easier
to setup and enables fast setup of a nice test bed.

Start by resetting everything on the demo target machines:

```bash
./votsible.sh --demo -t reset -t reset_docker_yes_yes_please
```

Then the installation:
```bash
./votsible.sh --demo -t dela
./votsible.sh --demo -t dela.run
./votsible.sh --demo -t dela -t dela.join

```

### Debugging
Traefik console for the web app should be visible [here](https://evtraefik.fsd.team/dashboard)__

### Examples

### Only on one host

```bash
./votsible  --prod
./votsible  --qual
./votsible  --test
./votsible  --demo
#./votsible  --dev
```

### Specifying a tag

```bash
./votsible --test -t "test"
```

### Specifying multiple tags

```bash
./votsible --test -t "tag1,tag2,tag3"
```

### Skip specifying a tag

```bash
./votsible --test --skip-tags "github_key_import"
```

### Skip specifying multiple tags

```bash
./votsible --test -skip-tags "tag1,tag2,tag3"
```




## Notes

### Git tags
| TAG | Short | Description |
| --- | ----- | ----------- |
| add | When the project welcome new files
| btf | Changes that do not affect the meaning of the code (beautifulage)
| cnf | Changes in app configuration files
| doc | Documentation only changes
| fix | A bug fix
| fea | A new feature
| hoc | Repository cleanup (HouseCleaning)
| ign | When adding a .gitignore file or similar
| oth | Other changes that don't modify src or test files
| rfa | A code change (refactor) that neither fixes bug nor adds a feature
| rvt | Reverts a previous commit
| tag | When adding a tag reference
| tst | Adding missing tests or correcting existing tests
| wip | Work in progress. E.g. in case of fire

### Links
 * C4DT D-Voting GitHub fork [repository][dvoting-repo]
 * C4DT Dela GitHub fork [repository][dela-repo]
 * D-Voting [Kanban][dvoting-kanban] and [issues][dvoting-issues]
 * Current [demo][dedis-demo] hosted by dedis
 * Reference [scripts][linus-scripts]
[linus-scripts]: https://github.com/c4dt/dela-scripts
[dvoting-repo]: https://github.com/c4dt/d-voting
[dela-repo]: https://github.com/c4dt/dela
[dvoting-issues]: https://github.com/c4dt/d-voting/issues
[dvoting-kanban]: https://github.com/orgs/c4dt/projects/6
[dedis-demo]: https://dvoting.c4dt.org


