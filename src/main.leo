// The 'avr' program.
program avr.aleo {

    // The 'Validator' registry mapping
    mapping validator_registry : address => Validator;

    // The 'Message' registry mapping
    struct Validator {
        validator_address: address,
        name: field,
        website_url: field,
        logo_url: field,
        description: field,
    }

    // register_validator is a function to register a new validator
    transition update_validator_as_admin(public new_validator: Validator) -> Validator {
        assert_eq(self.caller, aleo1c43jpf2txe5h839glx47knkg4pupvu5yzkqcg28ynhxqs74npqfqwrg3j9);
        return new_validator then finalize(new_validator);
    }
    // function to insert new validator address with name
    // only the current validator can insert a new validator
    finalize update_validator_as_admin(public new_validator: Validator) {
        Mapping::set(validator_registry, new_validator.validator_address, new_validator);
    }

    // put a new function that can only be called by the validator from the mappings
    transition update_validator_details(public new_validator: Validator) -> Validator {
        assert_eq(self.caller, new_validator.validator_address);
        return new_validator then finalize(new_validator);

    }

    //  function to finalize update validator address
    finalize update_validator_details(public new_validator: Validator) {
        let existing_validator_from_map: Validator = Mapping::get(validator_registry, new_validator.validator_address);
        assert_eq(new_validator.validator_address, existing_validator_from_map.validator_address);
        Mapping::set(validator_registry, new_validator.validator_address, existing_validator_from_map);
    }


    // register_validator is a function to register a new validator
    transition register_validator(public new_validator: Validator) -> Validator {
        assert_eq(self.caller, aleo1c43jpf2txe5h839glx47knkg4pupvu5yzkqcg28ynhxqs74npqfqwrg3j9);
        return new_validator then finalize(new_validator);
    }
    // function to insert new validator address with name
    // only the current validator can insert a new validator
    finalize register_validator(public new_validator: Validator) {
        Mapping::set(validator_registry, new_validator.validator_address, new_validator);
    }

    // update_validator is a function to update validator details
    // only the current validator can update a validator
    transition update_validator(public existing_validator: Validator) -> Validator {
        assert_eq(self.caller, existing_validator.validator_address);
        return existing_validator then finalize(existing_validator);
    }

    //  function to finalize update validator address
    //  only the current validator can update a validator
    finalize update_validator(public existing_validator: Validator) {
        // check if validator address already exists
        let existing_validator_from_map: Validator = Mapping::get(validator_registry, existing_validator.validator_address);
        assert_eq(existing_validator.validator_address, existing_validator_from_map.validator_address);
        Mapping::set(validator_registry, existing_validator.validator_address, existing_validator);
    }

}


