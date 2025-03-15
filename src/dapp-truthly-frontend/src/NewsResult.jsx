import React from "react";

export default function NewsResult({ news }) {
  return (
    <div className="mt-4">
      {news.map((item, index) => (
        <div key={index} className="bg-gray-200 p-4 rounded mb-2">
          <h2 className="font-bold">{item.title}</h2>
          <p>{item.result} - <span className="font-semibold">{item.confidence}% Akurat</span></p>
        </div>
      ))}
    </div>
  );
}
