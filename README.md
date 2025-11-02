# Simple - GitHub Action with Xcode code signing workflow
A simple Xcode project to show/test/automate building using Github Actions, especially with code signing, packaging and notarization done automatically.

The actions are defined in `.github/workflows/`
- `manual.yml` illustrates a manual workflow without real building, just passing ad-hoc parameters for a greeting written to the action logs.
- `build-default.yml` shows necessary actions to build and notarize an Xcode project. It consists of the following steps:
  -   **Xcode version** to log information about the build tool used
  -   **Install Apple certificate** to install the signing certificate into the action runners key-chain.
  -   **Checkout** to checkout the relevant source tree
  -   **Build** to to build the Xcode project and sign the binaries with the development teams signing certificate.
  -   **Notarize dmg** to send the signed disk image to Apple for notarization, and staple the notarization ticket to the disk image so it can be verified without internet connection.
  -   **Upload dmg** is storing the disk image as an artifact of the build action

For the `build-default.yml` action to properly work, the following secrets have to be configured on the Githubs sroject settings:
- KEYCHAIN_PASSWORD - A password to be used in the temporary key-chain database.
- BUILD_CERTIFICATE_BASE64 - The base64 encoded build certificate in .p12 format
- P12_PASSWORD - The password to decrypt and import the certificate
- AC_USER - The appstore connect username
- AC_PASSWORD - The corresponding password
- DEVELOPMENT_TEAM - The development team identifier
- DEVELOPMENT_TEAM_NAME - The development team name (unused in the scripts, but necessary to hide the name from the generated logs)


To read more see the GitHub Actions [documentation on Xcode application signing](https://docs.github.com/en/actions/how-tos/deploy/deploy-to-third-party-platforms/sign-xcode-applications).
