## API Key Hiding on Mobile Apps

Many beginner programmers usually hardcode the `api key` in a file within the project File Structure, This is dangerous you shouldn't do this because of this file at the end can be decompiled and it's content can be viewed as plain text.

**So, how to deal with that?**

Some may think it's a good pratice to store that key in `SAAS` like `Firebase` or even store it in the server which called later to stream the data after getting that key from, but how will the server identify your app.

calling a server with a **key** to get a **secured key**, what about the first key in that sentence?

After these questions, you will reach to a *dead road* (chicken and egg problem)

**Then what!**

Here Environment extension comes, `.env` files are usually used to store application sensitive and enviroment variables belong to the application.

So, make `.env` file at the project level, directly next to `pubspec.yaml` file
This file should contain the sensitive data needs to be secured or even enviromental variables, `apiKey` will be written or hardcoded in that file.

Then, we need a flutter package that can deal and operates with `.env` files (CRUD) operations like `envied`

You can see how this package is used in the config dart file, this file just reads apiKey value from the generated file(which will be generated through evied_generator and build_runner).

After running:
<table>
<tr>
<td>
dart run build_runner watch --delete-conflicting-outputs
</td>
</tr>
</table>

The *config.g.dart* file is generated which reads the apiKey value from `.env` file and generate two related integer lists to decode that apiKey and passes it back to caller.

After all, `.env` hardcodes the apiKey, while the generated file generated two integer lists in which from them it can rebuilds that apiKey.

Here comes 1 million question, which file can you use to regnerate that key?

- `.env` file, key is stored as plain text
- generated file `config.g.dart` you can use the equation of decryption and both lists to regenerate that key.

So, don't publish them publically in Version controll systems (VCS) **add both files in gitignore file**, but i didn't here, because it's just an example or a demo (it's not really an api key).
