import { BCBPreprocessor } from './preprocess';
import fs from 'fs';
import path from 'path';

// Read the JSON file
const rawJson = fs.readFileSync(path.resolve(__dirname, '/root/CryptOpt/src/bridge/llvm-bridge/llvm-bridge-test/src/func2.json'), 'utf-8');

// Parse the JSON file into an object
const raw = JSON.parse(rawJson);

// Create an instance of BCBPreprocessor
const preprocessor = new BCBPreprocessor();

// Use the preprocessRaw method with the parsed object
const result = preprocessor.preprocessRaw(raw);

// Log the result
console.log(result);