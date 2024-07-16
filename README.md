
## API Key Hiding on Mobile Apps

Many beginner programmers usually hardcode the `API key` in a file within the project file structure, This is dangerous and you shouldn't do this because this file can ultimately be decompiled, and its content can be viewed as plain text.

**So, how to deal with that?**

Some may think it's a good pratice to store that key in a `SaaS` pltform like `Firebase` or even store it in the server which called later to stream the data with after getting that key from, but how will the server identify your app.

calling a server with a **key** to get a **secured key**, what about the first key in that sentence?

After these questions, you will reach to a *dead end* (chicke-and-egg problem)

**Then what!**

Here Environment extension comes, `.env` files are usually used to store sensitive data and enviroment variables belong to the application.

So, create `.env` file at the project level, directly next to `pubspec.yaml` file
This file should contain the sensitive data needs to be secured or even enviromental variables, `API Key` will be written or hardcoded in that file.

Then, we need a Flutter package that can deal and operates with `.env` files and do (CRUD) operations like `envied`

You can see how this package is used in the config dart file, this file just reads apiKey value from the generated file(which will be generated through evied_generator and build_runner).

After running:

```
dart run build_runner watch --delete-conflicting-outputs
```

The *config.g.dart* file is generated which reads the `API Key` value from `.env` file and generates two related integer lists to decode that apiKey and passes it back to caller.

After all, `.env` file hardcodes the `API Key`, while the generated file generates two integer lists in which from them it can rebuilds that APIKey.

Here’s the million-dollar question: Which file can you use to regenerate that key?

- `.env` file, key is stored as plain text
- generated file `config.g.dart` you can use the equation of decryption and both lists to regenerate that key.

So, don't publish them publically in Version controll systems (VCS) **add both files in gitignore file**, but i didn't here, because it's just an example or a demo (it's not really an api key).

>while publishing that repo here, i have received an email from GitGuardian notifying me that *i have published a sensitive data (.env file)* thanks to them, So in real projects we don't.  

