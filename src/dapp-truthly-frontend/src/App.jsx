import { useState } from 'react';
import { dapp_truthly_backend } from 'declarations/dapp-truthly-backend';

import NewsChecker from "./NewsChecker";
import NewsResult from "./NewsResult";

export default function App() {
  const [news, setNews] = useState([]);

  const handleNewResult = (title, result, confidence) => {
    setNews([...news, { title, result, confidence }]);
  };

  return (
    <div className="min-h-screen bg-gray-100 p-6">
      <h1 className="text-3xl font-bold text-center">AI News Verifier</h1>
      <NewsChecker onVerify={handleNewResult} />
      <NewsResult news={news} />
    </div>
  );
}
