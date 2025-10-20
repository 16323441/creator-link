import './globals.css';
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'CreatorLink',
  description: 'NDA-gated marketplace for writers, directors & producers',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
