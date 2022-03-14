import PackagePlugin

@main struct SwiftGenPlugin: BuildToolPlugin {
    /// This plugin's implementation returns a single `prebuild` command to run `swiftgen`.
    func createBuildCommands(
        context: PackagePlugin.PluginContext,
        target: PackagePlugin.Target
    ) throws -> [Command] {
         // This example configures `swiftgen` to take inputs from a `swiftgen.yml` file
         let swiftGenConfigFile = context.package.directory.appending("swiftgen.yml")
         // Return a command to run `swiftgen` as a prebuild command. It will be run before
         // every build and generates source files into an output directory provided by the
         // build context. This example sets some environment variables that `swiftgen.yml`
         // bases its output paths on.
         return [.prebuildCommand(
             displayName: "Running SwiftGen⚠️",
             executable: try context.tool(named: "SwiftGenEx").path,
             arguments: [
                 "config", "run",
                 "-v", "--config", "\(swiftGenConfigFile)"
             ],
             environment: [
                 "PROJECT_DIR": "\(context.package.directory)",
                 "TARGET_NAME": "\(target.name)",
                 "DERIVED_SOURCES_DIR": "\(context.pluginWorkDirectory)",
             ],
             outputFilesDirectory: context.pluginWorkDirectory)]
    }
}
