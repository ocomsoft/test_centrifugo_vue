# Getting started

1. Run ./install.sh

2. Run 
```bash
./centrifugo gentoken -u 123722
```

3. Copy the token into src/components/HelloWorld.vue line 28

4. Add to the config the following
```json
  "publish": true
```
This enables the publish option used to send messages..


# Testing
When the vue app is running you can run ./test.sh
 to send a message that should appear on the browser.
 
