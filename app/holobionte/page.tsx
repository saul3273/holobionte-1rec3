'use client';
import { useState, useEffect } from 'react';

// Interfaces y Motor
export interface EstadoHolobionte {
  hospedador: {
    salud: number;
    energia: number;  
    recuperacion: number;
  };
  microbiota: {
    diversidad: number;
    equilibrio: number;
    metaboloma: number;
  };
}

export class MotorSimbiosis {
  calcularHomeostasis(estado: EstadoHolobionte): number {
    return (estado.hospedador.salud * estado.microbiota.diversidad) / 100;
  }

  simularInteraccion(
    inputHospedador: Partial<EstadoHolobionte['hospedador']>,
    inputMicrobiota: Partial<EstadoHolobionte['microbiota']>
  ): EstadoHolobionte {
    return {
      hospedador: { salud: 75, energia: 80, recuperacion: 70, ...inputHospedador },
      microbiota: { diversidad: 85, equilibrio: 60, metaboloma: 75, ...inputMicrobiota }
    };
  }
}

// Store
class HolobionteStore {
  private estado: EstadoHolobionte;
  private motor: MotorSimbiosis;

  constructor() {
    this.motor = new MotorSimbiosis();
    this.estado = this.motor.simularInteraccion({}, {});
  }

  actualizarEntrada(nuevosDatos: Partial<EstadoHolobionte>): number {
    this.estado = { 
      ...this.estado, 
      hospedador: { ...this.estado.hospedador, ...nuevosDatos.hospedador },
      microbiota: { ...this.estado.microbiota, ...nuevosDatos.microbiota }
    };
    return this.motor.calcularHomeostasis(this.estado);
  }

  getEstado(): EstadoHolobionte {
    return this.estado;
  }
}

// Componente Visual
const RedSimbiotica: React.FC<{ estado: EstadoHolobionte }> = ({ estado }) => {
  const homeostasis = (estado.hospedador.salud * estado.microbiota.diversidad) / 100;
  
  return (
    <div className="p-6 border-2 border-green-500 rounded-lg bg-gradient-to-br from-green-50 to-blue-50">
      <h3 className="text-xl font-bold mb-4 text-green-800">
        🌿 Red Simbiótica - Homeostasis: <span className="text-blue-600">{homeostasis.toFixed(1)}</span>
      </h3>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div className="p-4 bg-white rounded-lg shadow-md">
          <h4 className="font-semibold text-lg mb-3 text-blue-700">🏥 Hospedador</h4>
          <div className="space-y-2">
            <div>
              <span className="font-medium">Salud:</span>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-green-500 h-2 rounded-full" 
                  style={{ width: `${estado.hospedador.salud}%` }}
                ></div>
              </div>
              <span className="text-sm text-gray-600">{estado.hospedador.salud.toFixed(1)}</span>
            </div>
            
            <div>
              <span className="font-medium">Energía:</span>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-yellow-500 h-2 rounded-full" 
                  style={{ width: `${estado.hospedador.energia}%` }}
                ></div>
              </div>
              <span className="text-sm text-gray-600">{estado.hospedador.energia.toFixed(1)}</span>
            </div>
            
            <div>
              <span className="font-medium">Recuperación:</span>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-blue-500 h-2 rounded-full" 
                  style={{ width: `${estado.hospedador.recuperacion}%` }}
                ></div>
              </div>
              <span className="text-sm text-gray-600">{estado.hospedador.recuperacion.toFixed(1)}</span>
            </div>
          </div>
        </div>

        <div className="p-4 bg-white rounded-lg shadow-md">
          <h4 className="font-semibold text-lg mb-3 text-purple-700">🦠 Microbiota</h4>
          <div className="space-y-2">
            <div>
              <span className="font-medium">Diversidad:</span>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-purple-500 h-2 rounded-full" 
                  style={{ width: `${estado.microbiota.diversidad}%` }}
                ></div>
              </div>
              <span className="text-sm text-gray-600">{estado.microbiota.diversidad.toFixed(1)}</span>
            </div>
            
            <div>
              <span className="font-medium">Equilibrio:</span>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className={`h-2 rounded-full ${estado.microbiota.equilibrio >= 0 ? 'bg-green-500' : 'bg-red-500'}`}
                  style={{ width: `${Math.abs(estado.microbiota.equilibrio)}%` }}
                ></div>
              </div>
              <span className="text-sm text-gray-600">{estado.microbiota.equilibrio.toFixed(1)}</span>
            </div>
            
            <div>
              <span className="font-medium">Metaboloma:</span>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-orange-500 h-2 rounded-full" 
                  style={{ width: `${estado.microbiota.metaboloma}%` }}
                ></div>
              </div>
              <span className="text-sm text-gray-600">{estado.microbiota.metaboloma.toFixed(1)}</span>
            </div>
          </div>
        </div>
      </div>

      <div className="mt-4 p-3 bg-gradient-to-r from-green-100 to-blue-100 rounded-lg">
        <div className="text-center">
          <span className="font-semibold">Estado de Simbiosis: </span>
          <span className={
            homeostasis > 80 ? "text-green-600 font-bold" : 
            homeostasis > 50 ? "text-yellow-600" : "text-red-600"
          }>
            {homeostasis > 80 ? "ÓPTIMA" : homeostasis > 50 ? "ESTABLE" : "INESTABLE"}
          </span>
        </div>
      </div>
    </div>
  );
};

// Página Principal
export default function HolobiontePage() {
  const [store] = useState(() => new HolobionteStore());
  const [estado, setEstado] = useState(store.getEstado());

  useEffect(() => {
    const interval = setInterval(() => {
      const homeostasis = store.actualizarEntrada({
        hospedador: { 
          salud: Math.min(100, Math.max(0, estado.hospedador.salud + (Math.random() * 10 - 5))),
          energia: Math.min(100, Math.max(0, estado.hospedador.energia + (Math.random() * 8 - 4))),
          recuperacion: Math.min(100, Math.max(0, estado.hospedador.recuperacion + (Math.random() * 6 - 3)))
        },
        microbiota: { 
          diversidad: Math.min(100, Math.max(0, estado.microbiota.diversidad + (Math.random() * 12 - 6))),
          equilibrio: Math.min(100, Math.max(-100, estado.microbiota.equilibrio + (Math.random() * 8 - 4))),
          metaboloma: Math.min(100, Math.max(0, estado.microbiota.metaboloma + (Math.random() * 10 - 5)))
        }
      });
      setEstado(store.getEstado());
    }, 3000);

    return () => clearInterval(interval);
  }, [store, estado]);

  const reiniciarSimulacion = () => {
    const nuevoStore = new HolobionteStore();
    setEstado(nuevoStore.getEstado());
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 via-green-50 to-teal-50 py-8 px-4">
      <div className="max-w-4xl mx-auto">
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold text-green-800 mb-2">
            🦠 Holobionte Simulator
          </h1>
          <p className="text-lg text-gray-600 mb-4">
            Simulación en tiempo real de las interacciones simbióticas
          </p>
          <button 
            onClick={reiniciarSimulacion}
            className="px-6 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600 transition-colors"
          >
            🔄 Reiniciar Simulación
          </button>
        </div>

        <RedSimbiotica estado={estado} />

        <div className="mt-8 p-6 bg-white rounded-lg shadow-md">
          <h3 className="text-xl font-semibold mb-4">📊 Métricas del Holobionte</h3>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
            <div>
              <h4 className="font-semibold text-green-700">Homeostasis</h4>
              <p>Indica el equilibrio general del sistema holobionte.</p>
            </div>
            <div>
              <h4 className="font-semibold text-blue-700">Hospedador</h4>
              <p>Representa el organismo principal del sistema.</p>
            </div>
            <div>
              <h4 className="font-semibold text-purple-700">Microbiota</h4>
              <p>Comunidad de microorganismos simbióticos.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
