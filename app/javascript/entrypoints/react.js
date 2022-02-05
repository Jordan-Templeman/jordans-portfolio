import ReactOnRails from 'react-on-rails';
import 'bootstrap';
import '~/stylesheets/application.scss';
const modules = import.meta.globEager('../react/pages/**/*.tsx');

const registerModules = () => {
  const registeredModules = {};
  for (const [_, module] of Object.entries(modules)) {
    const defaultModule = module.default;
    registeredModules[defaultModule.name] = defaultModule;
  }
  return registeredModules;
};

ReactOnRails.register(registerModules());
