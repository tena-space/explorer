import {Button} from "@/components/ui/button.tsx";

export default function App() {
    return (
        <main className="flex min-h-svh flex-col items-center justify-center bg-background">
            <section className="w-full max-w-md p-8 bg-card rounded-lg shadow-md flex flex-col items-center">
                <h1 className="text-3xl font-bold mb-4 text-primary">Welcome to the Home Page</h1>
                <p className="mb-6 text-muted-foreground text-center">
                    This is your new home page, styled with shadcn/ui components.
                </p>
                <Button>Get Started</Button>
            </section>
        </main>
    )
}