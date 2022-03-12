import { matches, types as T, util, YAML } from "../deps.ts";

const { shape, string } = matches;

const noPropertiesFound: T.ResultType<T.Properties> = {
  result: {
    version: 2,
    data: {
      "Not Ready": {
        type: "string",
        value: "Could not find properties. The service might still be starting",
        qr: false,
        copyable: false,
        masked: false,
        description: "Fallback Message When Properties could not be found",
      },
    },
  },
} as const;

const configMatcher = shape({
  "tor-address": string,
});

export const properties: T.ExpectedExports.properties = async ( effects: T.Effects ) => {
  if (
    await util.exists(effects, {
      volumeId: "main",
      path: "start9/config.yaml",
    }) === false
  ) {
    return noPropertiesFound;
  }
  const config = configMatcher.unsafeCast(YAML.parse(
    await effects.readFile({
      path: "start9/config.yaml",
      volumeId: "main",
    }),
  ));
  const properties: T.ResultType<T.Properties> = {
    result: {
      version: 2,
      data: {
        "SSH/Tor Git Remote URL": {
          type: "string",
          value: `git@${config["tor-address"]}`,
          description: "Run <code>git remote add &lt;remote alias> &lt;this URL></code> to add your repo's SSH/Tor URL as a remote. See instructions for setup.",
          copyable: true,
          qr: false,
          masked: false,
        },
        "HTTP/Tor Git Remote URL": {
          type: "string",
          value: `http://${config["tor-address"]}`,
          description: "Run <code>git remote add &lt;remote alias> &lt;this URL></code> to add your repo's SSH/Tor URL as a remote. See instructions for setup.",
          copyable: true,
          qr: false,
          masked: false,
        },
      }
    }
  } as const;
  return properties;
};
