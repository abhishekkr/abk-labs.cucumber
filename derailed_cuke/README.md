
## derailed-cuke

> its running cucumber tests independently of Rails, just using Rake

---

### How To Use:

* run `fcuke`; it will do the required

> requirements are Ruby, Bundler Gem & Geckodriver

---

### How To Extend/Modify This

*  place all your Cucumber related files at their relative location in "./features" directory

> * Feature Files in "./features/"
> * Step Definitions in "./features/step_definitions/"
> * "paths.rb" in "./features/support/"
> * and so on

>  So, the "./features" directory in here is supposed to contain entire Cucumber generated structure


* Execute "Fcuke.rb", it will run cucumber tests for all features and store the output in "twrak.log".

> On every execution of 'Fcuke.rb", the earlier log gets wiped off.

---

