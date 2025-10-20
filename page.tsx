import Link from 'next/link';
import SubscriptionButton from '@/components/SubscriptionButton';

export default function Home() {
  return (
    <main className="max-w-5xl mx-auto p-6">
      <header className="flex items-center justify-between">
        <h1 className="text-2xl font-bold">CreatorLink</h1>
        <SubscriptionButton />
      </header>
      <section className="mt-10 grid gap-4 md:grid-cols-3">
        <div className="card"><h3 className="font-semibold">Writers</h3><p className="text-sm text-gray-600">Upload loglines & storylines (protected by NDA gate).</p></div>
        <div className="card"><h3 className="font-semibold">Directors</h3><p className="text-sm text-gray-600">Show reels & pitch decks.</p></div>
        <div className="card"><h3 className="font-semibold">Producers</h3><p className="text-sm text-gray-600">Browse by genre, request intros, download packets.</p></div>
      </section>
      <div className="mt-10">
        <Link className="btn btn-ghost" href="/dashboard">Go to Dashboard</Link>
      </div>
    </main>
  );
}
