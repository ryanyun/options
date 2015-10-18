# Slash Options

### Overall Winner of Barclays' 2015 _"Heroes vs. Hackers"_ Hackathon. 

## Description

__Slash Options__ is a marketplace for peer-to-peer decentralized option contract trading. 

Our platform allows any users to freely bid or ask for Bitcoin options without the need for a middleman. 

Once a contract is accepted by both parties, a Solidity smart contract containing a digital equivalent of the option's collateral is permanently stored on the Ethereum blockchain. 

The smart contract will automatically disperse the funds when the terms of the option are met.


## Background

This project was developed in less than 36 hours during Barclays' [Heroes vs. Hackers](http://heroesvshackers.com/) Hackathon with the goal of applying blockchain technology to financial services. 


## Features

+ Leverages the Ethereum protocol & Solidity to create smart option contracts.
+ Uses BlockApps' STRATO platform and the [BlockApps JavaScript API](https://github.com/blockapps/blockapps-js) to interface with the Ethereum blockchain. 
+ Integrated with Coinbase for user-authentication and access to Bitcoin wallets. 
+ Built with a Ruby on Rails back-end to support the platform and improve the user experience. 


## Build Instructions

1. __Slash Options__ runs on Rails (~ 4.2.0) and requires [Bundler](http://bundler.io/)
2. Create a [Coinbase sandbox](https://sandbox.coinbase.com/) account (create multiple accounts to test trading).
3. Install dependencies with `bundle install` 
4. Prepare databases with `rake db:migrate`
5. Startup WEBrick server with `rails server` and explore the App!


## Future

We will continue to develop __Slash Options__ with the support of Barclays and Rise New York.  

[Contact us](<mailto:walter.beller.morales@gmail.com>) if you have interest in the project. 

## Creators

- [Walter Beller-Morales](https://github.com/walterbm)

- [Chris Jeon](https://github.com/chrisjeon)

- [Ryan Yun](https://github.com/ryannyunn)


##### Copyright Walter Beller-Morales, Chris Jeon & Ryan Yun 2015