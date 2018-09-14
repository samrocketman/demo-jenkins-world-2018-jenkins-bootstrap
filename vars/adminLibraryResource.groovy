/**
  adminLibraryResource is a custom Jervis extension which allows platforms,
  toolchains, and lifecycles JSON files to be loaded from an alternative source
  different than the Jervis shared pipeline library.

  @param resource A resource located in the "resources/" directory at the root
                  of this repository
  @return A String which is the contents of the resource file.
 */
String call(String resource) {
    libraryResource "jenkins/world/2018/${resource}"
}
