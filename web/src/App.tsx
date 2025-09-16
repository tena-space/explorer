import Home from "./pages/Home";
import Dashboard from "./pages/Dashboard/Page";
import { Route, Routes } from "react-router";

export default function App() {
    return (
        <Routes>
            <Route path="/" element={<Home />} />

            <Route path="/dashboard" element={<Dashboard />} />
        </Routes>
    );
}