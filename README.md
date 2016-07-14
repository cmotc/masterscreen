# masterscreen
Transparent, simple key management for use with screen lockers.
masterscreen creates a hardened environment for personal documents
and sensitive configuration settings when you are AFK using gpg and
a screen locking system(I use it with xssstate and a fork of slock). It
enables you to

  * Unlock your screen using a gpg-encrypted file to check the password,
  allowing you to:
    1. Unlock your screen with a password other than your login password
    2. Never expose your screen unlock password to the disk.
  * Use the screen unlock file as a master password store for files and
    folders you want to decrypt transparenty when the screen is unlocked,
    allowing you to:
    1. Never expose your data unlock password to shoulder surfers or
    many keyloggers, because you never have to type it. It can also be
    crazy long.
    2. Foil attacks which attempt to pull raw data off the disk to bypass the
    screen lock, because your documents are transparently encrypted and
    decrypted when the screen lock is enabled and disabled, therefore they
    will only get encrypted files and password-protected private keys.

Obviously, the weakness is that if the password file is exfiltrated and it can
be bruteforced, it contains the password for the data private key. So keep it
safe.
