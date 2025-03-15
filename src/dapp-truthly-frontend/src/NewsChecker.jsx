import React, { useState } from "react";
import { dapp_truthly_backend } from "../declarations/dapp-truthly-backend";

export default function NewsChecker({ onVerify }) {
  const [title, setTitle] = useState("");
  const [content, setContent] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const [result, confidence] = await dapp_truthly_backend.verifyNews(title, content);
      onVerify(title, result, confidence);
    } catch (error) {
      console.error("Error verifying news:", error);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="bg-white p-4 rounded shadow">
      <input type="text" placeholder="Judul Berita" className="border p-2 w-full"
        value={title} onChange={(e) => setTitle(e.target.value)} required />
      <textarea placeholder="Isi Berita" className="border p-2 w-full mt-2"
        value={content} onChange={(e) => setContent(e.target.value)} required />
      <button type="submit" className="bg-blue-500 text-white px-4 py-2 rounded mt-2">
        Verifikasi
      </button>
    </form>
  );
}
