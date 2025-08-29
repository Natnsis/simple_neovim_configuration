local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- HTML boilerplate: type 'html' + <Tab>
ls.add_snippets("html", {
  s("html", {
    t({"<!DOCTYPE html>", "<html>", "\t<head>", "\t\t<title>"}), i(1, "Title"),
    t({"</title>", "\t</head>", "\t<body>", "\t\t"}), i(2),
    t({"", "\t</body>", "</html>"}),
  }),
  s("body", {
    t({"<body>", "\t"}), i(1),
    t({"", "</body>"}),
  }),
})

-- React: 'rafce' + <Tab> for arrow function export component
ls.add_snippets("typescriptreact", {
  s("rafce", {
    t({"import React from 'react';", "", "const "}), i(1, "Component"),
    t({" = () => {", "  return ("}),
    t({"    <div>", "      "}), i(2),
    t({"", "    </div>", "  );", "};", "", "export default "}), i(1),
    t({";"}),
  }),
  -- React Native: 'rnfe' + <Tab> for RN functional export
  s("rnfe", {
    t({"import React from 'react';", "import { View, Text } from 'react-native';", "", "const "}), i(1, "Component"),
    t({" = () => {", "  return ("}),
    t({"    <View>", "      <Text>"}), i(2, "Hello"),
    t({"</Text>", "    </View>", "  );", "};", "", "export default "}), i(1),
    t({";"}),
  }),
})
