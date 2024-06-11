## Dynamic Form Generator with Flutter

## Key Features
- **Dynamic Form Generation:** 
Creates forms based on JSON input.
- **Conditional Visibility:** 
Fields are shown or hidden based on conditions defined in the JSON.
- **Status Management with Riverpod:** 
Uses Riverpod to manage the status of forms and values entered.
- **Widget Construction Optimization:** 
Only necessary widgets are rebuilt when visibility conditions change.

## Project Architecture
(The project is quite simple for the architecture but thought was given to scalability)

Clean Architecture
Domain/
└── models/
Infrastructure
└──
Presentation
└── pages/
└─── providers/
└─── widgets/

## App usage.

It is simple just use the type that you want to display the json in input.


## How to modify the code (json to read)?

lib/data/data.dart

In that file you could add more json formats and you could also modify the existing ones.

## who is in charge of translating the json to the inputs?

lib/presentation/widgets/dynamic_form_widget.dart

Here you can modify the inputs to be rendered, you can add support (to that new element) or delete them.

## how to use the json to test

lib/presentation/pages/form_page.dart

In the _loadFormFields function you can find the comment 

//change this

there you can select what json you want to use

## how do you make the visibility condition?

lib/domain/visibility_evaluator.dart

this file here does the magic